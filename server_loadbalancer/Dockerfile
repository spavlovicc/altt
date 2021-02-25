FROM ubuntu
RUN apt-get update
RUN apt-get install nginx -y
COPY nginx.conf /etc/nginx/nginx.conf
CMD ["nginx", "-g", "daemon off;"]
