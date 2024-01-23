#This steps need to be done because nginx can't use the env variables
# So here, we change the variables to the value of env variables on a provided .env
# or add them to env

sed -i "s/__SCHOOL_USERNAME__/$SCHOOL_USERNAME/g" /etc/nginx/nginx.conf
sed -i "s/__NGINX_WORDPRESS_CONTAINER_NAME__/$NGINX_WORDPRESS_CONTAINER_NAME/g" /etc/nginx/nginx.conf
sed -i "s/__NGINX_WORDPRESS_PORT__/$NGINX_WORDPRESS_PORT/g" /etc/nginx/nginx.conf

nginx -g "daemon off;"