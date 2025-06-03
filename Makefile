
# Executables (local)
DOCKER_COMP = docker compose

# Docker containers
PHP_CONT = $(DOCKER_COMP) exec app

# Executables
PHP      = $(PHP_CONT) php
COMPOSER = $(PHP_CONT) composer

# ----------------------------------------------------------------------------------------------------------------------

install:
	cp .env.example .env
	@$(DOCKER_COMP) up -d

up:
	@$(DOCKER_COMP) up -d

down:
	@$(DOCKER_COMP) down --remove-orphans

rebuild:
	@$(DOCKER_COMP) up -d --build --remove-orphans

cs:
	@$(DOCKER_COMP) exec -e PHP_CS_FIXER_IGNORE_ENV=1 app vendor/bin/php-cs-fixer fix src

stan:
	@$(DOCKER_COMP) exec app php vendor/bin/phpstan analyse src

rector:
	@$(DOCKER_COMP) exec app php vendor/bin/rector

phpunit:
	@$(DOCKER_COMP) exec -e APP_ENV=test app vendor/bin/phpunit

codeception:
	@$(DOCKER_COMP) exec -e APP_ENV=test codeception vendor/bin/codecept run
