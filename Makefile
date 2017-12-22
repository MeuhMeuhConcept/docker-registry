.PHONY: help install start stop
.DEFAULT_GOAL := help

install: docker-compose.yml conf/registry.yml conf/registry-web.yml conf/auth.key ## Install

docker-compose.yml:
	cp docker-compose.yml.dist $@

conf/registry.yml:
	cp conf/registry.yml.dist $@

conf/registry-web.yml:
	cp conf/registry-web.yml.dist $@

conf/auth.key:
	openssl req -new -newkey rsa:4096 -days 365 -subj "/CN=MeuhMeuhConcept" \
        -nodes -x509 -keyout conf/auth.key -out conf/auth.cert

start: install ## Run with docker stack
	docker stack deploy --compose-file docker-compose.yml registry

stop: install ## Stop service
	docker stack rm registry

help:
	@grep -E '^[a-zA-Z_-.]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
