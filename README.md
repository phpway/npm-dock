# Dockerized Nginx / PHP / MySQL


## About this project

This project contains all you need to start developing PHP application with
Nginx/PHP/MySQL stack. All Nginx, PHP7 and MySQL run in separate Docker containers
to not interfere with your local env.

It is intended for local development and to help with setting up the web server,
php-fpm and mysql server in a separate env, so you can focus on coding the app.
Not recommended for production.

## Prerequisites
* Docker v17.0+

## Getting Started

In the examples below, replace `my-project` with name of your choice.

1. Clone project from GitHub
```
git clone https://github.com/phpway/npm-dock.git my-project
```

2. Tweak config files as you need. There are config files for `php.ini`, `composer.json`,
`nginx site` and `sql schema` located under `my-project/config` directory. If you need
to modify a particular file, copy the `.dist` file into one with the same name but
without the `.dist` extension (e.g. `cp php.ini.dist php.ini`). Do not modify the dist
files. Dist files will be used if you don't create a non-dist copies.

3. Start docker containers
```
cd my-project/scripts
./start.sh
```
This will build the images if necessary and start the containers. The application will run
at `http://localhost:8080` where the document root directory is mapped to `my-project/src/public`.
If this directory doesn't exist, it will be created with a sample `index.php` file.

4. Mount your existing project files to `my-project/src`.

5. For accessing the database, open `PhpMyAdmin` at `http://localhost:9080` and login as `root` with empty password.
