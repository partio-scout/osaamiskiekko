use axum::{
    Router,
    routing::get,
    response::{Json, Result},
    http::StatusCode,
};
use serde::Deserialize;
use serde_json::Value;
use std::env;
use std::fmt;
use std::net::SocketAddr;
use tower::ServiceBuilder;
use tower_http::trace::TraceLayer;

use osaamiskiekko::controllers::error::ApiError;

#[tokio::main]
async fn main() {
    let app = Router::new()
        .route("/health", get(get_health))
        .layer(ServiceBuilder::new().layer(TraceLayer::new_for_http())); // Logging

    let addr = SocketAddr::from(([0, 0, 0, 0], 3001));

    println!("Osaamiskiekko Health checker listening on {}", addr);

    axum::Server::bind(&addr)
        .serve(app.into_make_service())
        .await
        .unwrap();
}

#[derive(Deserialize)]
struct Course {
    id: String,
    match_count: usize,
    best_match: f32,
}

#[derive(Deserialize)]
struct Match {
    id: String,
}

pub async fn get_health() -> Result<(StatusCode, Json<Value>), ApiError> {
    println!("Get health");

    let api_url = match env::var("API_URL") {
        Ok(val) => val,
        Err(_) => "http://localhost:3000/api/v1".to_string(),
    };

    let frontpage_url = match env::var("FRONTPAGE_URL") {
        Ok(val) => val,
        Err(_) => "https://www.osaamiskiekko.fi/fi/".to_string(),
    };

    let searchpage_url = match env::var("SEARCHPAGE_URL") {
        Ok(val) => val,
        Err(_) => "https://www.osaamiskiekko.fi/fi/hakukone/".to_string(),
    };

    match call_endpoints(&api_url, &frontpage_url, &searchpage_url).await {
        Ok(_) => {
            Result::Ok((
                StatusCode::OK,
                Json(serde_json::json!({
                    "healthy": true
                }))
            ))
        },
        Err(err) => {
            Result::Ok((
                StatusCode::INTERNAL_SERVER_ERROR,
                Json(serde_json::json!({
                    "healthy": false,
                    "message": err.to_string()
                }))
            ))
        }
    }
}

pub async fn call_endpoints(api_url : &str, frontpage_url : &str, searchpage_url : &str) -> Result<(), HealthError> {
    let client = reqwest::Client::builder().build().unwrap();

    validate_remote_content(&client, frontpage_url, "<div id=\"__nuxt\">").await?;
    validate_remote_content(&client, searchpage_url, "<div id=\"app\"></div>").await?;

    let vst_course_id = call_courses_endpoint(&client, &format!("{}/vst", &api_url)).await?;
    call_course_endpoint(&client, &format!("{}/vst/{}", &api_url, &vst_course_id)).await?;
    let match_id = call_matches_endpoint(&client, &format!("{}/vst/{}/matches", &api_url, &vst_course_id)).await?;
    call_match_endpoint(&client, &format!("{}/vst/{}/matches/{}", &api_url, &vst_course_id, &match_id)).await?;

    let formal_course_id = call_courses_endpoint(&client, &format!("{}/formal", &api_url)).await?;
    call_course_endpoint(&client, &format!("{}/formal/{}", &api_url, &formal_course_id)).await?;
    let match_id = call_matches_endpoint(&client, &format!("{}/formal/{}/matches", &api_url, &formal_course_id)).await?;
    call_match_endpoint(&client, &format!("{}/formal/{}/matches/{}", &api_url, &formal_course_id, &match_id)).await?;

    Ok(())
}

pub async fn validate_remote_content(client : &reqwest::Client, url : &str, expected_content : &str) -> Result<(), HealthError> {
    let body = read_remote(&client, url).await?;
    if !body.contains(expected_content) {
        return Err(HealthError::UnhealthyContent(format!("Page {} does not contain the expected content", url).to_string()));
    }

    Ok(())
}

pub async fn call_courses_endpoint(client : &reqwest::Client, url : &str) -> Result<String, HealthError> {
    let courses : Vec<Course> = serde_json::from_str(&read_remote(&client, &url).await?)?;
    if courses.len() < 1 {
        return Err(HealthError::UnhealthyContent("Too few courses".to_string()));
    }
    let course = &courses[0];
    if course.match_count < 1 {
        return Err(HealthError::UnhealthyContent("The best course has too few matches".to_string()));
    }
    if course.best_match <= 0.0 {
        return Err(HealthError::UnhealthyContent("The best match is too poor".to_string()));
    }

    Ok(course.id.to_owned())
}

pub async fn call_course_endpoint(client : &reqwest::Client, url : &str) -> Result<(), HealthError> {
    let course : Course = serde_json::from_str(&read_remote(&client, &url).await?)?;
    if course.match_count < 1 {
        return Err(HealthError::UnhealthyContent("Course has too few matches".to_string()));
    }
    if course.best_match <= 0.0 {
        return Err(HealthError::UnhealthyContent("Course best match is too poor".to_string()));
    }

    Ok(())
}

pub async fn call_matches_endpoint(client : &reqwest::Client, url : &str) -> Result<String, HealthError> {
    let matches : Vec<Match> = serde_json::from_str(&read_remote(&client, &url).await?)?;
    if matches.len() < 1 {
        return Err(HealthError::UnhealthyContent(format!("Too few matches ({})", url).to_string()));
    }
    let course_match = &matches[0];

    Ok(course_match.id.to_owned())
}

pub async fn call_match_endpoint(client : &reqwest::Client, url : &str) -> Result<(), HealthError> {
    let _course_match : Match = serde_json::from_str(&read_remote(&client, &url).await?)?;

    Ok(())
}

pub async fn read_remote(client : &reqwest::Client, url : &str) -> Result<String, HealthError> {
    let request = client.get(url);
    let response = request.send().await?;
    let status_code = response.status().as_u16();
    let body = response.text().await?;

    if status_code != 200 {
        return Err(HealthError::HttpNotOk(status_code));
    }

    return Ok(body)
}


pub enum HealthError {
    HttpNotOk(u16),
    HttpError(String),
    InvalidJsonError(String),
    UnhealthyContent(String),
}

impl fmt::Debug for HealthError {
    fn fmt(&self, f: &mut fmt::Formatter) -> fmt::Result {
        match self {
            HealthError::HttpNotOk(status) => write!(f, "HTTP call returned status {}", status),
            HealthError::HttpError(msg) => write!(f, "{}", msg),
            HealthError::InvalidJsonError(msg) => write!(f, "Invalid JSON: {}", msg),
            HealthError::UnhealthyContent(msg) => write!(f, "Unhealthy content: {}", msg),
        }
    }
}

impl fmt::Display for HealthError {
     fn fmt(&self, f: &mut fmt::Formatter) -> fmt::Result {
        write!(f, "{:?}", self)
    }
}

impl From<serde_json::Error> for HealthError {
    fn from(err: serde_json::Error) -> Self {
        HealthError::InvalidJsonError(err.to_string())
    }
}

impl From<std::str::Utf8Error> for HealthError {
    fn from(err: std::str::Utf8Error) -> Self {
        HealthError::InvalidJsonError(format!("JSON contains invalid unicode: {}", err.to_string()))
    }
}

impl From<reqwest::Error> for HealthError {
    fn from(err: reqwest::Error) -> Self {
        HealthError::HttpError(err.to_string())
    }
}
