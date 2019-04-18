FROM nginx:alpine
ADD  nginx.conf /etc/nginx/
COPY build /var/www
EXPOSE 80
ENTRYPOINT ["nginx","-g","daemon off;"]