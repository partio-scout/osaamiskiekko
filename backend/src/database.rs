use std::fmt;
use std::env;
use serde_json::Value;
use mongodb::{
    bson::{ self, Document, doc, oid::ObjectId },
    options::{UpdateOptions, ClientOptions},
    Client, Collection, Database,
};

const DB_NAME: &str = "osaamiskiekko";
const APP_NAME: &str = "osaamiskiekko";


#[derive(Debug)]
pub struct DB {
    pub db_name: String,
    pub client: Client,
}

pub enum DbError {
    NotFound(),
    MongoDbError(String),
    InvalidOidError(String),
    InvalidJsonError(String),
}

impl std::fmt::Display for DbError {
    fn fmt(&self, f: &mut fmt::Formatter) -> fmt::Result {
        write!(f, "{:?}", self)
    }
}

impl std::fmt::Debug for DbError {
    fn fmt(&self, f: &mut fmt::Formatter) -> fmt::Result {
        match &*self {
            DbError::NotFound() => write!(f, "{}", self),
            DbError::MongoDbError(msg) => write!(f, "{}", msg),
            DbError::InvalidOidError(msg) => write!(f, "{}", msg),
            DbError::InvalidJsonError(msg) => write!(f, "{}", msg),
        }
    }
}

impl From<mongodb::bson::oid::Error> for DbError {
    fn from(err: mongodb::bson::oid::Error) -> Self {
        DbError::InvalidOidError(err.to_string())
    }
}

impl From<mongodb::bson::ser::Error> for DbError {
    fn from(err: mongodb::bson::ser::Error) -> Self {
        DbError::InvalidJsonError(err.to_string())
    }
}

impl From<mongodb::bson::document::ValueAccessError> for DbError {
    fn from(err: mongodb::bson::document::ValueAccessError) -> Self {
        DbError::InvalidJsonError(err.to_string())
    }
}

impl From<mongodb::error::Error> for DbError {
    fn from(err: mongodb::error::Error) -> Self {
        DbError::MongoDbError(err.to_string())
    }
}

impl From<serde_json::Error> for DbError {
    fn from(err: serde_json::Error) -> Self {
        DbError::InvalidJsonError(err.to_string())
    }
}

impl From<std::str::Utf8Error> for DbError {
    fn from(err: std::str::Utf8Error) -> Self {
        DbError::InvalidJsonError(err.to_string())
    }
}


impl DB {
    pub async fn init() -> Result<Self, DbError> {
        let mongodb_host = match env::var("MONGO_HOST") {
            Ok(val) => val,
            Err(_) => "127.0.0.1".to_string(),
        };
        let db_name = match env::var("MONGO_DB") {
            Ok(val) => val,
            Err(_) => DB_NAME.to_string(),
        };

        let mut client_options = ClientOptions::parse(format!("mongodb://{}:27017", mongodb_host)).await?;
        client_options.app_name = Some(APP_NAME.to_string());

        Ok(Self {
            db_name,
            client: Client::with_options(client_options)?
        })
    }

    pub fn get_database(&self) -> Database {
        self.client.database(&self.db_name)
    }

    pub fn collection(&self, collection_name: &str) -> Collection<Document> {
        self.client.database(&self.db_name).collection::<Document>(collection_name)
    }

    pub async fn get_document(&self, collection_name: &str, id: &str) -> Result<Document, DbError> {
        let collection = self.client.database(DB_NAME).collection::<Document>(collection_name);
        let id = ObjectId::parse_str(&id)?;
        let filter = doc! { "_id": id };
        match collection.find_one(filter, None).await? {
            Some(document) => Result::Ok(document),
            None => return Result::Err(DbError::NotFound()),
        }
    }

    pub async fn upsert_document(&self, collection_name : &str, filter: bson::Document, raw_json: bytes::Bytes) -> Result<(), DbError> {
        let raw_document: Value = serde_json::from_str(std::str::from_utf8(&raw_json)?)?;
        let update_document = doc! { "$set": bson::to_bson(&raw_document)? };
        let collection = self.collection(collection_name);
        collection.update_one(filter, update_document, Some(UpdateOptions::builder().upsert(true).build())).await?;
        Ok(())
    }

}
