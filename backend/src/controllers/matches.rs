use axum::{
    response::{Json, Result},
    extract::{Extension, Path},
};
use futures::StreamExt;
use mongodb::{
    bson::doc,
    Collection
};
use serde::{Serialize, Deserialize};
use serde_json::Value;
use std::sync::Arc;
use std::str;

use crate::database::DB;
use crate::mongo_collections::*;
use crate::controllers::error::ApiError;
use crate::controllers::courses::{Matches, HobbyCourse, FormalDegree};

const MAX_KEYWORDS : usize = 10;

pub async fn get_degree_matches(Extension(db): Extension<Arc<DB>>, Path(id): Path<String>) -> Result<Json<Value>, ApiError> {
    println!("Get formal degree matches {}", &id);

    let matches_collection = db.get_database().collection::<Matches>(FORMAL_MATCHES_COLLECTION);
    let hobby_collection = db.get_database().collection::<HobbyCourse>(HOBBY_COURSE_COLLECTION);

    let matches = match matches_collection.find_one(doc! { "_id": &id }, None).await? {
        Some(val) => val,
        None => return Result::Err(ApiError::NotFound()),
    };

    let mut results: Vec<Value> = Vec::new();
    for result in matches.matches {
        let course = match hobby_collection.find_one(doc! { "_id": &result.result_id }, None).await? {
            Some(val) => val,
            None => {
                println!("WARNING: Hobby course {} was not found from DB even though it's referenced in formal matches", &result.result_id);
                continue
            },
        };

        let description = match course.description {
            Some(d) => serde_json::json!({"fi": d}),
            None => serde_json::json!({})
        };

        results.push(serde_json::json!({
            "id": result.result_id,
            "name": {
                "fi": course.title,
            },
            "credits": course.credits,
            "organization": course.organization_name,
            "description": description,
            "url": course.url,
            "tutkinnonosat": result.matching_courses,
            "keywords": clamped_slice(&result.keywords, MAX_KEYWORDS)
        }));
    }

    Result::Ok(Json(serde_json::json!(&results)))
}

pub async fn get_degree_match(Extension(db): Extension<Arc<DB>>, Path((degree_id, result_id)): Path<(String, String)>) -> Result<Json<Value>, ApiError> {
    println!("Get formal degree match {} vs {}", &degree_id, &result_id);

    let matches_collection = db.get_database().collection::<Matches>(FORMAL_MATCHES_COLLECTION);
    let hobby_collection = db.get_database().collection::<HobbyCourse>(HOBBY_COURSE_COLLECTION);

    let matches = match matches_collection.find_one(doc! { "_id": &degree_id }, None).await? {
        Some(val) => val,
        None => return Result::Err(ApiError::NotFound()),
    };

    let mut match_result : Option<Value> = None;

    for result in matches.matches {
        if result.result_id != result_id {
            continue
        }

        let course = match hobby_collection.find_one(doc! { "_id": &result.result_id }, None).await? {
            Some(val) => val,
            None => {
                println!("WARNING: Hobby course {} was not found from DB even though it's referenced in formal matches", &result.result_id);
                continue
            },
        };

//         let description = match course.description {
//             Some(d) => serde_json::json!({"fi": d}),
//             None => serde_json::json!({})
//         };

        match_result = Some(serde_json::json!({
            "id": result.result_id,
            "name": { "fi": course.title },
            "tutkinnonosat": result.matching_courses,
            "keywords": clamped_slice(&result.keywords, MAX_KEYWORDS)
        }));

        break
    }

    match match_result {
        Some(r) => Result::Ok(Json(serde_json::json!(&r))),
        None => Result::Err(ApiError::NotFound())
    }
}

#[derive(Serialize, Deserialize)]
struct Feedback {
    feedback: i32
}

#[derive(Serialize, Deserialize)]
struct FeedbackInsert {
    entity_id: String,
    result_id: String,
    feedback: i32,
    // TODO: timestamp, IP address
}

pub async fn feedback_degree_match(Extension(db): Extension<Arc<DB>>, Path((degree_id, result_id)): Path<(String, String)>, raw_json: bytes::Bytes) -> Result<Json<Value>, ApiError> {
    println!("Feedback for degree match {} vs {}", &degree_id, &result_id);

    let feedback: Feedback = serde_json::from_str(str::from_utf8(&raw_json)?)?;

    let document = FeedbackInsert {
        entity_id: degree_id,
        result_id,
        feedback: feedback.feedback,
    };

    let collection: Collection<FeedbackInsert> = db.get_database().collection::<FeedbackInsert>(FORMAL_FEEDBACK_COLLECTION);
    collection.insert_one(document, None).await?;

    // Debug
    let collection = db.collection(FORMAL_FEEDBACK_COLLECTION);
    let mut cursor = collection.find(None, None).await?;
    while let Some(doc) = cursor.next().await {
        println!("{:?}", doc?);
    }

    Result::Ok(Json(serde_json::json!( { "status": "ok" } )))
}

pub async fn feedback_vst_match(Extension(db): Extension<Arc<DB>>, Path((course_id, result_id)): Path<(String, String)>, raw_json: bytes::Bytes) -> Result<Json<Value>, ApiError> {
    println!("Feedback for hobby match {} vs {}", &course_id, &result_id);

    let feedback: Feedback = serde_json::from_str(str::from_utf8(&raw_json)?)?;

    let document = FeedbackInsert {
        entity_id: course_id,
        result_id,
        feedback: feedback.feedback,
    };

    let collection: Collection<FeedbackInsert> = db.get_database().collection::<FeedbackInsert>(HOBBY_FEEDBACK_COLLECTION);
    collection.insert_one(document, None).await?;

    // Debug
    let collection = db.collection(HOBBY_FEEDBACK_COLLECTION);
    let mut cursor = collection.find(None, None).await?;
    while let Some(doc) = cursor.next().await {
        println!("{:?}", doc?);
    }

    Result::Ok(Json(serde_json::json!( { "status": "ok" } )))
}


pub async fn get_vst_matches(Extension(db): Extension<Arc<DB>>, Path(id): Path<String>) -> Result<Json<Value>, ApiError> {
    println!("Get hobby matches {}", id);

    let matches_collection = db.get_database().collection::<Matches>(HOBBY_MATCHES_COLLECTION);
    let formal_collection = db.get_database().collection::<FormalDegree>(FORMAL_DEGREE_COLLECTION);

    let matches = match matches_collection.find_one(doc! { "_id": &id }, None).await? {
        Some(val) => val,
        None => return Result::Err(ApiError::NotFound()),
    };

    let mut results: Vec<Value> = Vec::new();
    for result in matches.matches {
        let degree = match formal_collection.find_one(doc! { "_id": &result.result_id }, None).await? {
            Some(val) => val,
            None => {
                println!("WARNING: Formal degree {} was not found from DB even though it's referenced in hobby matches", &result.result_id);
                continue
            },
        };

        let description = match degree.description {
            Some(d) => serde_json::json!({"fi": d}),
            None => serde_json::json!({})
        };

        results.push(serde_json::json!({
            "id": result.result_id,
            "name": { "fi": degree.title },
            "field": { "fi": degree.field },
            "level": { "fi": degree.level },
            "degrees": { "fi": degree.degrees },
            "description": description,
            "credits": degree.credits,
            "organizations_count": degree.organizers.len(),
            "organizations": degree.organizers,
            "validated": false, // TODO
            "url": degree.url,
            "tutkinnonosat": result.matching_courses,
            "keywords": clamped_slice(&result.keywords, MAX_KEYWORDS)
        }));
    }

    Result::Ok(Json(serde_json::json!(&results)))
}

pub async fn get_vst_match(Extension(db): Extension<Arc<DB>>, Path((course_id, result_id)): Path<(String, String)>) -> Result<Json<Value>, ApiError> {
    println!("Get hobby match {} vs {}", &course_id, &result_id);

    let matches_collection = db.get_database().collection::<Matches>(HOBBY_MATCHES_COLLECTION);
    let formal_collection = db.get_database().collection::<FormalDegree>(FORMAL_DEGREE_COLLECTION);

    let matches = match matches_collection.find_one(doc! { "_id": &course_id }, None).await? {
        Some(val) => val,
        None => return Result::Err(ApiError::NotFound()),
    };

    let mut match_result: Option<Value> = None;

    for result in matches.matches {
        if result.result_id != result_id {
            continue
        }

        let degree = match formal_collection.find_one(doc! { "_id": &result.result_id }, None).await? {
            Some(val) => val,
            None => {
                println!("WARNING: Formal degree {} was not found from DB even though it's referenced in hobby matches", &result.result_id);
                continue
            },
        };

//         let description = match degree.description {
//             Some(d) => serde_json::json!({"fi": d}),
//             None => serde_json::json!({})
//         };

        match_result = Some(serde_json::json!({
            "id": result.result_id,
            "name": { "fi": degree.title },
            "validated": false, // TODO
            "tutkinnonosat": result.matching_courses,
            "keywords": result.keywords,
            // "organizations": degree.organizers
        }));

        break;
    }

    match match_result {
        Some(r) => Result::Ok(Json(serde_json::json!(&r))),
        None => Result::Err(ApiError::NotFound())
    }
}

fn clamped_slice<T>(vec: &[T], max_len: usize) -> &[T] {
    let len = std::cmp::min(vec.len(), max_len);
    &vec[..len]
}
