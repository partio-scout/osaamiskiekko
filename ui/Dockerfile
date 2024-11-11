# Building:
# docker image build -t docker.vxt-research.com/osaamiskiekko-ui .

FROM node:19-alpine3.15 as building

WORKDIR /usr/src/osaamiskiekko-ui
COPY . .
RUN npm install
RUN npm run build


FROM nginx:1.17-alpine

RUN apk add --no-cache bash

COPY --from=building /usr/src/osaamiskiekko-ui/dist /usr/share/nginx/html
COPY nginx.conf /etc/nginx/conf.d/default.conf
