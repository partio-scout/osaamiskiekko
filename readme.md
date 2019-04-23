# Partio Osaamiskiekko-palvelu

# Install

Install docker and run command: docker-compose up

# Info

cms backend is built with strapi and uses the official strapi image https://github.com/strapi/strapi-docker

frontend is created with create-react-app and can be found in the frontend folder

postgres is used as database

# Running production version locally

Production uses nginx frontend to serve static react app and relay requests to backend. 

  docker-compose --project-directory . -f docker-compose.yml -f docker-compose-frontend.yml up \
  api db frontend

Frontend is accessible by default at http://localhost:80 
