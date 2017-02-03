#!make

PWD = $(shell pwd)

all: up

up:
	@docker-compose up -d

test:
	@xdg-open http://galaxy.docker

discover-services:
	@curl -s http://dnsdock.docker/services | json_pp

down:
	@docker-compose down

update-gitlab:
	docker-compose run gitlab update-permissions
	docker-compose restart gitlab

config-gitlab:
	docker-compose run gitlab vim /etc/gitlab/gitlab.rb
	docker-compose restart gitlab



