FROM ubuntu
RUN apt update && apt -y install nginx
COPY index.html /var/www/html
CMD ["nginx", "-g", "daemon off;"]
