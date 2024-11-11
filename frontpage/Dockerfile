FROM node:14-alpine as building

RUN apk add --no-cache python3 py3-pip g++ make bash

WORKDIR /usr/src/osaamiskiekko-frontpage
COPY . .

RUN npm install
RUN npm run build
RUN npm run generate


FROM nginx:1.17-alpine

RUN apk add --no-cache bash

COPY --from=building /usr/src/osaamiskiekko-frontpage/dist /usr/share/nginx/html
COPY nginx.conf /etc/nginx/conf.d/default.conf
