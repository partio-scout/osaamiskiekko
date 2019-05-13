FROM node:11.1.0-alpine

WORKDIR /usr/src/api

RUN echo "unsafe-perm = true" >> ~/.npmrc

RUN npm install -g strapi@alpha

COPY . ./
RUN chmod +x ./strapi.sh

RUN npm install --prefix cms

EXPOSE 1337

COPY healthcheck.js ./
HEALTHCHECK --interval=15s --timeout=5s --start-period=30s \
      CMD node /usr/src/api/healthcheck.js

CMD ["./strapi.sh"]
