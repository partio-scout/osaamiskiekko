# Partio Osaamiskiekko-palvelu

# INFO

- cms backend is built with strapi and uses the official strapi image https://github.com/strapi/strapi-docker
- frontend is created with create-react-app and can be found in the frontend folder
- postgres is used as database

# DEV

Install docker and run command: 

  docker-compose up

# PRODUCTION

Production uses nginx frontend to serve static react app and relay requests to backend. 
Frontend is accessible by default at http://localhost

  docker-compose --project-directory . -f docker-compose.yml -f compose/frontend.yml up api db frontend

# TESTING

## Running End-To-End tests with Robotframework

Robot tests can be ran in docker (chrome default)

  docker-compose --project-directory . -f docker-compose.yml -f compose/frontend.yml -f compose/robot.yml up api db frontend robot
  
## Running robot locally

- Install PIP
- Install requirements: pip install -r ./robot/requirements.txt
- Install Google Chrome
- Download latest chromedriver http://chromedriver.chromium.org/
- place chromedriver (osx) /usr/local/bin/chromedriver
- Run locally:
BROWSER=chrome SERVER=https://www.eficode.com/home SELENIUM= python run.py -d ./results

Firefox: Download and install firefox + geckodriver https://github.com/mozilla/geckodriver/releases

## Frontend Jest Unit tests

docker-compose --project-directory . -f compose/frontend-unittests.yml up