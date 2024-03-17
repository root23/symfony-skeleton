include .env

up:
	docker-compose up -d
down:
	docker-compose down
build:
	docker-compose build
build-no-cache:
	docker-compose build --no-cache
fpm-bash:
	docker-compose exec fpm bash
