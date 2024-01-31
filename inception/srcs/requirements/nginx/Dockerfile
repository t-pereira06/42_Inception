FROM debian:bullseye

EXPOSE 443

ARG SCHOOL_USERNAME
ARG DOMAIN_NAME
ARG NGINX_CERT
ARG NGINX_KEY
ARG CERT_DIR

RUN apt-get update

RUN apt-get install -y --no-install-recommends nginx openssl
RUN apt install gettext-base -y

# openssl req : generates certificate signing request
# -x509 : creates self-signed certificate instead of certf req
# -nodes : key w/ no password
# -days 365 : validity set to 365 days
# -newkey rsa:4096 : generates new 4096-bit RSA key 
# -keyout $$NGINX_KEY : output file for private key
# -out /etc/nginx/ssl/nginx.crt : output file for public certificate
# -subj "/C=PT/ST=Porto/L=Porto/O=42 Porto/CN=tsodre-p" : information on certificate

RUN mkdir -p ${CERT_DIR}

RUN openssl req -x509 -nodes -sha256 -newkey rsa:4096  \
                -out ${NGINX_CERT} \
                -keyout ${NGINX_KEY} \
                -subj /C=PT/ST=Porto/L=Porto/O=42/CN=$DOMAIN_NAME/UID=$SCHOOL_USERNAME

RUN mkdir -p /var/run/nginx

COPY conf/nginx.conf /etc/nginx

RUN sed -i "s#{{NGINX_KEY}}#$NGINX_KEY#g" /etc/nginx/nginx.conf
RUN sed -i "s#{{NGINX_CERT}}#$NGINX_CERT#g" /etc/nginx/nginx.conf
RUN sed -i "s#{{DOMAIN_NAME}}#$DOMAIN_NAME#g" /etc/nginx/nginx.conf

RUN chmod 755 /var/www/html
RUN chown -R www-data:www-data /var/www/html

RUN cat /etc/nginx/nginx.conf

ENTRYPOINT ["nginx", "-g", "daemon off;"]
