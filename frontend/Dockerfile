FROM node:alpine
# Create app directory
RUN mkdir -p /usr/src/app/frontend
WORKDIR /usr/src/app/frontend
# Install app dependencies
COPY package.json /usr/src/app//frontend/
RUN npm install
# Bundle app source
COPY . /usr/src/app/frontend
EXPOSE 3000
CMD [ "npm", "start" ]
