FROM ubuntu:22.04
LABEL "Email"="suramnithin@gmail.com" 
RUN apt update -y \
    && apt install nginx -y \
    && apt install -y unzip iputils-ping net-tools 
COPY index.html /var/www/html/index.nginx-debian.html
COPY scorekeeper.js /var/www/html/scorekeeper.js
COPY style.css /var/www.html/style.css
#HEALTHCHECK CMD curl --fail http://localhost || exit 1
CMD ["nginx", "-g", "daemon off;"]
