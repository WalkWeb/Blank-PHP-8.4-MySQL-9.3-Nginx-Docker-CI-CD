# Example Blank Project: PHP 8.4 + MySQL 9.3 + Nginx + Docker + CI/CD

Project template on stack:

- PHP 8.4
- MySQL 9.3
- Nginx
- Docker
- GitLab CI/CD

Tested on desktop Ubuntu 24 and VPS Ubuntu 24

## Local build

Requirements:

- Docker

Build:

`cp .env.example .env`

`docker compose up -d`

Added `127.0.0.1 app.loc` in `/etc/hosts`

Open `app.loc` in browser:

## Server build and CI/CD

Requirements:

- Docker
- GitLab Account

1. Create new project repository in GitLab
2. Change git remote origin repository to your GitLab project repository and pull project to GitLab
3. Build project in your server by analogy local build from your GitLab repository
4. Set up unauthorized access git pull (add server `id_rsa.pub` in Account -> Preferences -> SSH Keys)
5. Set CI/CD variables (Settings -> CI/CD -> Variables):
    - $SSH_PRIVATE_KEY - Private key `id_rsa` (and `id_rsa.pub` must set in `authorized_keys` in your server for 
    unauthorized access connect GitLab in your server)
    - $SERVER_USER - user on your server
    - $SERVER_HOST - IP your server
    - $APP_DIR - application directory in your server

6. Make changes to the main branch and check CI/CD (Project -> Build -> Pipelines):

![alt_text](public/img/ci-cd.png)
