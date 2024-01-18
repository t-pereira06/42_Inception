FROM alpine:3.18.5

RUN apk update && apk upgrade

RUN apk add nginx

COPY nginx.conf /etc/nginx/nginx.conf

CMD ["nginx", "-g", "daemon off;"]
