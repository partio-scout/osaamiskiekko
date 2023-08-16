use std::net::SocketAddr;
use tower::ServiceBuilder;
use std::sync::Arc;
use tower_http::trace::TraceLayer;

use axum::{
    Router,
    extract::Extension,
    routing::{get, post, delete},
};

use osaamiskiekko::controllers::{
    courses,
    matches,
};
use osaamiskiekko::database::DB;

#[tokio::main]
async fn main() {
    let db = match DB::init().await {
        Ok(client) => client,
        Err(error) => panic!("Unable to connect to database {:?}", error),
    };

    let shared_state = Arc::new(db);

    let app = Router::new()
        .route(&versioned("/formal_degrees/:id/matches"), post(courses::update_formal_matches))
        .route(&versioned("/formal_degrees/:id"), post(courses::update_formal_degree))
        .route(&versioned("/formal_degrees/:id"), delete(courses::delete_formal_degree))
        .route(&versioned("/hobby_courses/:id"), post(courses::update_hobby_course))
        .route(&versioned("/hobby_courses/:id"), delete(courses::delete_hobby_course))
        .route(&versioned("/hobby_courses/:id/matches"), post(courses::update_hobby_matches))
        .route(&versioned("/formal"), delete(courses::reset_formal))
        .route(&versioned("/hobby"), delete(courses::reset_vst))

        .route(&versioned("/formal"), get(courses::get_formal_degrees))
        .route(&versioned("/formal/:degree_id"), get(courses::get_formal_degree))
        .route(&versioned("/formal/:degree_id/matches/:result_id"), get(matches::get_degree_match))
        .route(&versioned("/formal/:degree_id/matches"), get(matches::get_degree_matches))
        .route(&versioned("/formal/:degree_id/matches/:result_id"), post(matches::feedback_degree_match))
        .route(&versioned("/vst"), get(courses::get_vst_courses))
        .route(&versioned("/vst/:course_id"), get(courses::get_vst_course))
        .route(&versioned("/vst/:course_id/matches/:result_id"), get(matches::get_vst_match))
        .route(&versioned("/vst/:course_id/matches"), get(matches::get_vst_matches))
        .route(&versioned("/vst/:course_id/matches/:result_id"), post(matches::feedback_vst_match))

        .layer(ServiceBuilder::new().layer(TraceLayer::new_for_http())) // Logging
        .layer(Extension(shared_state)); // DB


    let addr = SocketAddr::from(([0, 0, 0, 0], 3000));

    println!("Osaamiskiekko backend listening on {}", addr);

    axum::Server::bind(&addr)
        .serve(app.into_make_service())
        .await
        .unwrap();
}

fn versioned(path : &str) -> String {
    format!("/api/v1{}", path)
}
