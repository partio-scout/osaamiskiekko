# Partio Osaamiskiekko-palvelu

# Install

Install docker and run command: docker-compose up

# Info

cms backend is built with strapi and uses the official strapi image https://github.com/strapi/strapi-docker

frontend is created with create-react-app and can be found in the frontend folder

postgres is used as database

# Deploy to nginx

docker-compose -f docker-compose-frontend.yml build dist
docker-compose -f docker-compose-frontend.yml run dist
docker-compose -f docker-compose-frontend.yml build frontend
docker-compose -f docker-compose-frontend.yml up frontend