FROM debian:bullseye

ARG SCHOOL_USERNAME
ARG DOMAIN_NAME
ARG NGINX_CERT
ARG NGINX_KEY

RUN apt-get update

RUN apt-get install -y --no-install-recommends nginx openssl
RUN apt install gettext-base -y

RUN mkdir -p /etc/nginx/ssl

# openssl req : generates certificate signing request
# -x509 : creates self-signed certificate instead of certf req
# -nodes : key w/ no password
# -days 365 : validity set to 365 days
# -newkey rsa:4096 : generates new 4096-bit RSA key 
# -keyout $$NGINX_KEY : output file for private key
# -out /etc/nginx/ssl/nginx.crt : output file for public certificate
# -subj "/C=PT/ST=Porto/L=Porto/O=42 Porto/CN=tsodre-p" : information on certificate

RUN cd /etc/nginx/ssl

RUN openssl req -x509 -nodes -sha256 -newkey rsa:4096  \
                -out $NGINX_CERT \
                -keyout $NGINX_KEY \
                -subj /C=PT/ST=Porto/L=Porto/O=42/OU=42Porto=$DOMAIN_NAME/UID=$SCHOOL_USERNAME

RUN cd ..

COPY conf/nginx.conf /etc/nginx/nginx.conf

RUN sed -i "s|{{NGINX_KEY}}|$NGINX_KEY|g" /etc/nginx/nginx.conf
RUN sed -i "s|{{NGINX_CERT}}|$NGINX_CERT|g" /etc/nginx/nginx.conf
RUN sed -i "s|{{DOMAIN_NAME}}|$DOMAIN_NAME|g" /etc/nginx/nginx.conf

RUN chmod 755 /var/www/html
RUN chown -R www-data:www-data /var/www/html

CMD ["nginx", "-g", "daemon off;"]
