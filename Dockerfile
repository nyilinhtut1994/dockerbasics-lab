#we will use Alpine Linux for this project
FROM alpine:latest

#Update & install nginx
RUN apk update && \
    apk add nginx && \
    rm -rf /var/cache/apk/*

#Copy nginx config file 
COPY nginx.conf /etc/nginx/http.d/default.conf

#Create a html directory
RUN mkdir -p /var/www/html

#Copy index.html file to the /var/www/html
COPY index.html /var/www/html/

#Change ownership of /var/www/html to user 'nginx'
RUN chown -R nginx:nginx /var/www/html

#Set working directory
WORKDIR /var/www/html

#Expose port 80
EXPOSE 80

#Start ngix on container startup
CMD ["nginx", "-g", "daemon off;"]