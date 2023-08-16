use axum::{
    response::{Json, Result},
    extract::{Extension, Path, Query},
};
use futures::StreamExt;
use mongodb::{
    options::{FindOptions, UpdateOptions},
    bson::{self, doc},
    //Collection
};
use serde::{Serialize, Deserialize};
use serde_json::Value;
use std::{
    sync::Arc,
    collections::HashMap,
};

use crate::database::DB;
use crate::mongo_collections::*;
use crate::controllers::error::ApiError;

#[derive(Serialize, Deserialize, Debug)]
pub struct Matches {
    pub matches: Vec<Match>
}

#[derive(Serialize, Deserialize, Debug)]
pub struct Match {
    pub result_id: String,
    pub keywords: Vec<String>,
    pub similarity: f32,
    pub matching_courses: Vec<String>,
}

#[derive(Deserialize)]
pub struct FormalDegree {
    pub _id: String,
    pub title: String,
    pub description: Option<String>,
    pub credits: Option<String>,
    pub organizers: Vec<String>,
    pub organizer_aliases: Vec<String>,
    pub field: Option<String>,
    pub level: Option<String>,
    pub degrees: Vec<String>,
    pub url: String,
}

#[derive(Deserialize)]
struct FormalDegreeSummary {
    _id: String,
    title: Option<String>,
    credits: Option<String>,
    organizers: Vec<String>,
    organizer_aliases: Vec<String>,
    field: Option<String>,
    level: Option<String>,
    degrees: Vec<String>,
    url: String,
    match_count: Option<usize>,
    best_match: Option<f32>
}

#[derive(Deserialize)]
pub struct HobbyCourse {
    pub _id: String,
    pub description: Option<String>,
    pub credits: Option<String>,
    pub field: Option<String>,
    pub title: String,
    pub url: String,
    pub organization_name: String,
}

#[derive(Deserialize)]
struct HobbyCourseSummary {
    _id: String,
    title: String,
    description: Option<String>,
    credits: Option<String>,
    organization_name: String,
    url: String,
    match_count: Option<usize>,
    best_match: Option<f32>
}

fn validate_api_key(params: HashMap<String, String>) -> Result<(), ApiError> {
    let api_key = match std::env::var("API_KEY") {
        Ok(val) => val,
        Err(_) => {
            println!("API_KEY environment variable has not been set");
            return Err(ApiError::Forbidden("Invalid api_key".to_string()))
        }
    };

    match params.get("api_key") {
        Some(provided_key) => {
            if *provided_key != api_key {
                println!("Invalid API key");
                return Err(ApiError::Forbidden("Invalid api_key".to_string()))
            } else {
                return Ok(())
            }
        },
        None => {
            println!("Missing API key");
            return Err(ApiError::Forbidden("Missing api_key".to_string()))
        }
    };
}

pub async fn reset_formal(Extension(db): Extension<Arc<DB>>, Query(params): Query<HashMap<String, String>>) -> Result<Json<Value>, ApiError> {
    validate_api_key(params)?;
    println!("Reset formal");

    db.collection(FORMAL_COURSE_COLLECTION).delete_many(doc! {}, None).await?;
    db.collection(FORMAL_DEGREE_COLLECTION).delete_many(doc! {}, None).await?;
    db.collection(FORMAL_MATCHES_COLLECTION).delete_many(doc! {}, None).await?;

    Result::Ok(Json(serde_json::json!( { "status": "ok", } )))
}

pub async fn reset_vst(Extension(db): Extension<Arc<DB>>, Query(params): Query<HashMap<String, String>>) -> Result<Json<Value>, ApiError> {
    validate_api_key(params)?;
    println!("Reset VST");

    db.collection(HOBBY_COURSE_COLLECTION).delete_many(doc! {}, None).await?;
    db.collection(HOBBY_MATCHES_COLLECTION).delete_many(doc! {}, None).await?;

    Result::Ok(Json(serde_json::json!( { "status": "ok", } )))
}

// pub async fn update_formal_course(Extension(db): Extension<Arc<DB>>, Query(params): Query<HashMap<String, String>>, Path(id): Path<String>, raw_json: bytes::Bytes) -> Result<Json<Value>, ApiError> {
//     println!("Update formal course {}", id);
//     validate_api_key(params)?;
//     db.upsert_document(FORMAL_COURSE_COLLECTION, doc! { "_id": id }, raw_json).await?;
//     Result::Ok(Json(serde_json::json!( { "status": "ok" } )))
// }

pub async fn update_formal_degree(Extension(db): Extension<Arc<DB>>, Query(params): Query<HashMap<String, String>>, Path(id): Path<String>, raw_json: bytes::Bytes) -> Result<Json<Value>, ApiError> {
    println!("Update formal degree {}", id);
    validate_api_key(params)?;
    db.upsert_document(FORMAL_DEGREE_COLLECTION, doc! { "_id": id }, raw_json).await?;
    Result::Ok(Json(serde_json::json!( { "status": "ok" } )))
}

pub async fn update_hobby_course(Extension(db): Extension<Arc<DB>>, Query(params): Query<HashMap<String, String>>, Path(id): Path<String>, raw_json: bytes::Bytes) -> Result<Json<Value>, ApiError> {
    println!("Update hobby course {}", id);
    validate_api_key(params)?;
    db.upsert_document(HOBBY_COURSE_COLLECTION, doc! { "_id": id }, raw_json).await?;
    Result::Ok(Json(serde_json::json!( { "status": "ok" } )))
}


pub async fn update_formal_matches(Extension(db): Extension<Arc<DB>>, Query(params): Query<HashMap<String, String>>, Path(id): Path<String>, raw_json: bytes::Bytes) -> Result<Json<Value>, ApiError> {
    println!("Update formal matches {}", id);
    validate_api_key(params)?;

    let matches: Matches = serde_json::from_str(std::str::from_utf8(&raw_json)?)?;
    let update_document = doc! { "$set": bson::to_bson(&matches)? };
    let matches_collection = db.collection(FORMAL_MATCHES_COLLECTION);
    matches_collection.update_one(doc! { "_id": &id }, update_document, Some(UpdateOptions::builder().upsert(true).build())).await?;

    let best_match_score = if let Some(best_match) = matches.matches.first() {
        best_match.similarity
    } else {
        0.0
    };

    let degrees_collection = db.collection(FORMAL_DEGREE_COLLECTION);
    degrees_collection.update_one(
        doc! { "_id": &id },
        doc! { "$set": { "match_count": matches.matches.len() as u32, "best_match": best_match_score } },
        None
    ).await?;

    Result::Ok(Json(serde_json::json!( { "status": "ok" } )))
}

pub async fn update_hobby_matches(Extension(db): Extension<Arc<DB>>, Query(params): Query<HashMap<String, String>>, Path(id): Path<String>, raw_json: bytes::Bytes) -> Result<Json<Value>, ApiError> {
    println!("Update hobby matches {}", id);
    validate_api_key(params)?;

    let matches: Matches = serde_json::from_str(std::str::from_utf8(&raw_json)?)?;
    let update_document = doc! { "$set": bson::to_bson(&matches)? };
    let matches_collection = db.collection(HOBBY_MATCHES_COLLECTION);
    matches_collection.update_one(doc! { "_id": &id }, update_document, Some(UpdateOptions::builder().upsert(true).build())).await?;

    let best_match_score = if let Some(best_match) = matches.matches.first() {
        best_match.similarity
    } else {
        0.0
    };

    let degrees_collection = db.collection(HOBBY_COURSE_COLLECTION);
    degrees_collection.update_one(
        doc! { "_id": &id },
        doc! { "$set": { "match_count": matches.matches.len() as u32, "best_match": best_match_score } },
        None
    ).await?;

    Result::Ok(Json(serde_json::json!( { "status": "ok" } )))
}

pub async fn delete_formal_degree(Extension(db): Extension<Arc<DB>>, Query(params): Query<HashMap<String, String>>, Path(id): Path<String>) -> Result<Json<Value>, ApiError> {
    println!("Delete formal degree {}", id);
    validate_api_key(params)?;

    db.collection(FORMAL_DEGREE_COLLECTION).delete_many(doc! { "_id": id }, None).await?;

    Result::Ok(Json(serde_json::json!({ "status": "ok" })))
}

pub async fn delete_hobby_course(Extension(db): Extension<Arc<DB>>, Query(params): Query<HashMap<String, String>>, Path(id): Path<String>) -> Result<Json<Value>, ApiError> {
    println!("Delete hobby course {}", id);
    validate_api_key(params)?;

    db.collection(HOBBY_COURSE_COLLECTION).delete_many(doc! { "_id": id }, None).await?;

    Result::Ok(Json(serde_json::json!({ "status": "ok" })))
}

pub async fn get_formal_degrees(Extension(db): Extension<Arc<DB>>) -> Result<Json<Value>, ApiError> {
    println!("Get formal degrees");

    let collection = db.get_database().collection::<FormalDegreeSummary>(FORMAL_DEGREE_COLLECTION);
    let find_options = FindOptions::builder()
        .projection(doc! { "title": 1, "credits": 1, "level": 1, "field": 1, "degrees": 1, "url": 1, "organizers": 1, "organizer_aliases": 1, "best_match": 1, "match_count": 1 })
        .sort(doc! { "best_match": -1 })
        .build();

    let mut cursor = collection.find(None, find_options).await?;
    let mut results: Vec<Value> = Vec::new();
    while let Some(degree) = cursor.next().await {
        let degree = match degree {
            Ok(d) => d,
            Err(msg) => {
                println!("Skipped invalid record: {}", msg.to_string());
                continue
            }
        };

        results.push(render_formal_degree_summary(degree));
    }

    Result::Ok(Json(serde_json::json!(&results)))
}

pub async fn get_formal_degree(Extension(db): Extension<Arc<DB>>, Path(id): Path<String>) -> Result<Json<Value>, ApiError> {
    println!("Get formal degree {}", id);

    let collection = db.get_database().collection::<FormalDegreeSummary>(FORMAL_DEGREE_COLLECTION);

    let degree = match collection.find_one(doc! { "_id": &id }, None).await? {
        Some(val) => val,
        None => return Result::Err(ApiError::NotFound()),
    };

    Result::Ok(Json(render_formal_degree_summary(degree)))
}

fn render_formal_degree_summary(degree : FormalDegreeSummary) -> Value {
    let organizations_count = degree.organizers.len();

    serde_json::json!({
        "id": degree._id,
        "field": { "fi": degree.field },
        "level": { "fi": degree.level },
        "name": { "fi": degree.title },
        "degrees": { "fi": degree.degrees },
        "credits": degree.credits,
        "organizations_count": organizations_count,
        "organizations": degree.organizers,
        "organization_aliases": degree.organizer_aliases,
        "url": degree.url,
        "match_count": degree.match_count,
        "best_match": degree.best_match,
    })
}

pub async fn get_vst_courses(Extension(db): Extension<Arc<DB>>) -> Result<Json<Value>, ApiError> {
    println!("Get hobby courses");

    let collection = db.get_database().collection::<HobbyCourseSummary>(HOBBY_COURSE_COLLECTION);
    let find_options = FindOptions::builder()
        .projection(doc! { "title": 1, "credits": 1, "organization_name": 1, "url": 1, "best_match": 1, "match_count": 1 })
        .sort(doc! { "best_match": -1 })
        .build();

    let mut cursor = collection.find(None, find_options).await?;
    let mut results: Vec<Value> = Vec::new();
    while let Some(course) = cursor.next().await {
        let course = course?;
        results.push(serde_json::json!({
            "id": course._id,
            "name": { "fi": course.title },
            "credits": course.credits,
            "organization": course.organization_name,
            "url": course.url,
            "match_count": course.match_count,
            "best_match": course.best_match,
        }));
    }

    Result::Ok(Json(serde_json::json!(&results)))
}

pub async fn get_vst_course(Extension(db): Extension<Arc<DB>>, Path(id): Path<String>) -> Result<Json<Value>, ApiError> {
    println!("Get vst course");

    let collection = db.get_database().collection::<HobbyCourseSummary>(HOBBY_COURSE_COLLECTION);

    let course = match collection.find_one(doc! { "_id": &id }, None).await? {
        Some(val) => val,
        None => return Result::Err(ApiError::NotFound()),
    };

    Result::Ok(Json(serde_json::json!({
        "id": course._id,
        "name": { "fi": course.title },
        "description": { "fi": course.description },
        "credits": course.credits,
        "organization": course.organization_name,
        "url": course.url,
        "match_count": course.match_count,
        "best_match": course.best_match,
    })))
}
