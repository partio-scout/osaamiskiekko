# Partio Osaamiskiekko-palvelu

# Strapi account

partioadmin:6QVAjgusFD3YL7x

# INFO

- cms backend uses strapi https://strapi.io/
- frontend is created with create-react-app and can be found in the frontend folder
- postgres is used as database

## Concerning StrapiCMS source code and backend code

StrapiCMS code is kept in the osaamiskiekko repository although it's not developed as part of this project. ***Do not edit /backend/cms files manually***. They can get modified when using the Strapi admin content editing features. Commit only intended changes.

# DEV

- Install docker 
- Run locally: `docker-compose up`

# PRODUCTION

Production uses nginx frontend to serve static react app and relay requests to backend. 
Frontend is accessible by default at http://localhost

```
docker-compose --project-directory . -f docker-compose.yml -f compose/frontend.yml up backend db frontend
```

# TESTING

## Running End-To-End tests with Robotframework

Robot tests can be ran in docker (chrome default). Run makefile in project root: `make run-robot`
  
## Running robot locally

- Install PIP
- Install requirements: `pip install -r ./robot/requirements.txt`
- Install Google Chrome
- Download latest chromedriver http://chromedriver.chromium.org/
- place chromedriver (osx) /usr/local/bin/chromedriver
- Run locally:
  `BROWSER=chrome SERVER=https://www.eficode.com/home SELENIUM= python run.py -d ./results`

Firefox: Download and install firefox + geckodriver https://github.com/mozilla/geckodriver/releases

## Frontend Jest Unit tests

```
docker-compose --project-directory . -f compose/frontend-unittests.yml up
```

## Running Sonarkube locally

- Install sonar-scanner (https://docs.sonarqube.org/display/SCAN/Analyzing+with+SonarQube+Scanner)
- Run locally: `sonar-scanner -Dsonar.login=partionosaamiskiekko-bot -Dsonar.password=GET_FROM_RTM.DEV.EFICODE.IO`

# Makefile

The makefile allows executing common development tasks more easily.

- Copy strapi datamodels from docker to tmp folder (just in case): `make backupdatamodels`
- Get postgres database dump from docker which contains everything (can be used as test data for example): `make getdatabasedump`
- Get only data dump from postgres: `make getdatabasedump-dataonly`
- Restore data after Strapi has created tables accordingly: `make restoredata-dataonly`

## Deploying to kubernetes

Configure cubectl cluster according to the environment you're using. For example locally `minikube start` also configures kubectl cluster.

Osaamiskiekko docker images must be in an artifactory accessible from the kubernetes cluster you're using. If your artifactory requires credentials add them with for example:

```
kubectl create secret docker-registry eficode-artifactory-cred --docker-server=artifactory.dev.eficode.io --docker-username=INSERT_PASSWORD_HERE --docker-password=INSERT_PASSWORD_HERE --docker-email=partionosaamiskiekko-bot@rum.invalid
```

Run `make deploy` to deploy with image names

```
backendimage=artifactory.dev.eficode.io/partionosaamiskiekko/osaamiskiekko/backend_master:aec5463d \
frontendimage=artifactory.dev.eficode.io/partionosaamiskiekko/osaamiskiekko/frontend_master:aec5463d \
make deploy
```

If running locally in minikube, you can find the URL of the deployed service with `minikube service list`

# Update Container

docker-compose build servicename

# Run only one container

docker-compose up servicename

# Docker commands 
 - list running containers: `docker ps -a`
 - remove container: `docker rm container_name`
 - remove image: `docker rmi image`
 - stop all containers: `docker stop $(docker ps -a -q)`
 - kill all running containers: `docker kill $(docker ps -q)`
 - delete all stopped containers: `docker rm $(docker ps -a -q)`
 - delete all images: `docker rmi $(docker images -q)`
 - list volumes: `docker volume ls` 
 - remove everything (containers, images, volumes): `docker system prune -a`
 - clean networks: `docker network prune`
 - clean containers: `docker container prune`
 - connect docker container with sh or alternative /bin/bash: `docker exec -it ID sh`
 - install package on alpine docker: `apk add nano`

# Database and Strapi setup

Strapi new command generates database setup so backend/cms contains strapi binary which is copied to docker.
cms/api contains the generated datamodel created with strapi UI
cms/config/environments/development/database.json contains docker db info
docker-compose file has sql init script for postgres. sql init file is located in backend/postgre/dump.sql
sql dump has been modified as it cant drop or create database with the current user

## Copy postgres database
```
docker exec -t CONTAINER_ID pg_dump --data-only -U myuser -d mydb > ./backend/postgre/dump_dataonly.sql 
docker exec -t partio_db_1 pg_dump --clean --if-exists -U myuser -d mydb > ./tmp/postgre/dump_new.sql   
docker exec -t partio_db_1 pg_dumpall -U myuser -d mydb > ./tmp/postgre/dump_all.sql   
```

## Restore database
```
cat ./backend/postgre/dump.sql | docker exec -i CONTAINER_ID psql -U myuser -d mydb
```

## Copy strapi datamodels from docker
```
docker cp CONTAINER_ID:/usr/src/api/strapi-app/api ./backend/datamodels
```

## Copy datamodel back to docker 
```
docker cp ./backend/datamodels/api/* CONTAINER_ID:/usr/src/api/cms/api
```

## Backup all
```
docker exec -t CONTAINER_ID pg_dumpall -c -U myuser -l mydb > ./backend/postgre/dump_`date +%d-%m-%Y"_"%H_%M_%S`.sql
```
