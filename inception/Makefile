NAME = inception
SRCS = ./srcs/
COMPOSE = ./srcs/docker-compose.yml

all: conf up

conf: #dont forget the env
	@cp ./.env ./srcs/
	@echo "Creating volumes...\n"
	@mkdir -p /home/tsodre-p/data/mariadb_vol /home/tsodre-p/data/wordpress_vol
	@sudo sed -i '/^127.0.0.1/ {/tsodre-p.42.fr/! s/localhost/localhost tsodre-p.42.fr/}' /etc/hosts
	@echo "\n"
	@echo "Starting docker compose up..."

up:
	docker compose -p $(NAME) -f $(COMPOSE) up --build -d mariadb wordpress nginx

down:
	docker compose -p $(NAME) down --volumes

start:
	docker compose -p $(NAME) start

stop:
	docker compose -p $(NAME) stop

clean-images:
	docker rmi -f $$(docker images -q) || true

clean: down clean-images

fclean: clean
	@sudo rm -rf /home/tsodre-p/data
	@docker system prune

re: fclean conf up
