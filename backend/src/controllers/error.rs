use axum::http::StatusCode;
use axum::response::{Json, Response, IntoResponse};
use std::fmt;
use crate::database::DbError;

pub enum ApiError {
    DBError(String),
    InvalidOidError(String),
    InvalidJsonError(String),
    NotFound(),
    Forbidden(String),
    MissingParam(String),
    InternalServerError(String),
}

impl IntoResponse for ApiError {
    fn into_response(self) -> Response {
        let (status, json) = match self {
            ApiError::DBError(msg) => {
                (StatusCode::INTERNAL_SERVER_ERROR, serde_json::json!(
                    {
                        "status": "error",
                        "message": msg.to_string()
                    }
                ))
            },
            ApiError::InvalidOidError(msg) => {
                (StatusCode::NOT_FOUND, serde_json::json!(
                    {
                        "status": "error",
                        "message": msg.to_string()
                    }
                ))
            },
            ApiError::InvalidJsonError(msg) => {
                (StatusCode::BAD_REQUEST, serde_json::json!(
                    {
                        "status": "error",
                        "message": msg.to_string()
                    }
                ))
            },
            ApiError::NotFound() => {
                (StatusCode::NOT_FOUND, serde_json::json!(
                    {
                        "status": "error",
                        "message": "Not found"
                    }
                ))
            },
            ApiError::Forbidden(msg) => {
                (StatusCode::FORBIDDEN, serde_json::json!(
                    {
                        "status": "forbidden",
                        "message": msg
                    }
                ))
            },
            ApiError::MissingParam(msg) => {
                (StatusCode::BAD_REQUEST, serde_json::json!(
                    {
                        "status": "error",
                        "message": format!("Missing parameter {}", msg)
                    }
                ))
            },
            ApiError::InternalServerError(msg) => {
                (StatusCode::INTERNAL_SERVER_ERROR, serde_json::json!(
                    {
                        "status": "error",
                        "message": msg.to_string()
                    }
                ))
            },
        };

        (status, Json(json)).into_response()
    }
}

impl fmt::Debug for ApiError {
    fn fmt(&self, f: &mut fmt::Formatter) -> fmt::Result {
        write!(f, "{:?}", self)
    }
}

impl From<mongodb::bson::oid::Error> for ApiError {
    fn from(err: mongodb::bson::oid::Error) -> Self {
        ApiError::InvalidOidError(err.to_string())
    }
}

impl From<mongodb::bson::ser::Error> for ApiError {
    fn from(err: mongodb::bson::ser::Error) -> Self {
        ApiError::InvalidJsonError(err.to_string())
    }
}

impl From<mongodb::bson::document::ValueAccessError> for ApiError {
    fn from(err: mongodb::bson::document::ValueAccessError) -> Self {
        ApiError::InvalidJsonError(err.to_string())
    }
}

impl From<mongodb::error::Error> for ApiError {
    fn from(err: mongodb::error::Error) -> Self {
        ApiError::DBError(err.to_string())
    }
}

impl From<serde_json::Error> for ApiError {
    fn from(err: serde_json::Error) -> Self {
        ApiError::InvalidJsonError(err.to_string())
    }
}

impl From<reqwest::Error> for ApiError {
    fn from(err: reqwest::Error) -> Self {
        ApiError::InternalServerError(err.to_string())
    }
}

impl From<std::str::Utf8Error> for ApiError {
    fn from(err: std::str::Utf8Error) -> Self {
        ApiError::InvalidJsonError(format!("Request contains invalid unicode: {}", err.to_string()))
    }
}

impl From<DbError> for ApiError {
    fn from(err: DbError) -> Self {
        ApiError::InternalServerError(err.to_string())
    }
}
