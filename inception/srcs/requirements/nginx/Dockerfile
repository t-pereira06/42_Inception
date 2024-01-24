FROM debian:bullseye

RUN apt-get update

RUN apt-get install -y --no-install-recommends nginx openssl

RUN mkdir -p /etc/nginx/ssl

# openssl req : generates certificate signing request
# -x509 : creates self-signed certificate instead of certf req
# -nodes : key w/ no password
# -days 365 : validity set to 365 days
# -newkey rsa:4096 : generates new 4096-bit RSA key 
# -keyout /etc/nginx/ssl/nginx.key : output file for private key
# -out /etc/nginx/ssl/nginx.crt : output file for public certificate
# -subj "/C=PT/ST=Porto/L=Porto/O=42 Porto/CN=tsodre-p" : information on certificate
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout /etc/nginx/ssl/nginx.key -out /etc/nginx/ssl/nginx.crt \
    -subj "/C=PT/ST=Porto/L=Porto/O=42 Porto/CN=tsodre-p"

COPY conf/nginx.conf /etc/nginx/nginx.conf

CMD ["nginx", "-g", "daemon off;"]
