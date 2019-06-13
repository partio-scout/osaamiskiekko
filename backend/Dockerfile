FROM node:lts-alpine

WORKDIR /usr/src/api

RUN echo "unsafe-perm = true" >> ~/.npmrc

RUN apk update
RUN apk add --no-cache build-base gcc autoconf automake libtool zlib-dev libpng-dev nasm

RUN npm install -g strapi@beta --unsafe-perm

# DIRECTORIES
COPY ./cms/api ./cms/api
COPY ./cms/config ./cms/config
COPY ./cms/extensions ./cms/extensions
COPY ./cms/public ./cms/public
# ROOT FILES
COPY ./cms/package.json ./cms/package.json
COPY ./cms/favicon.ico ./cms/favicon.ico
# STARTUP SCRIPT
COPY ./strapi.sh ./

RUN chmod +x ./strapi.sh

RUN (cd cms && npm install)
RUN (cd cms && strapi build)

EXPOSE 1337

COPY healthcheck.js ./
HEALTHCHECK --interval=15s --timeout=5s --start-period=30s \
      CMD node /usr/src/api/healthcheck.js

CMD ["./strapi.sh"]
