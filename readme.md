# Developer environment based on Docker for Laravel

## Usage

Go to project root directory (it must be under git) and add new submodule

```
git submodule add https://github.com/omadonex/laravel-docker.git
```

Go to `laradock` directory and copy .env.example to .env you can leave its contents as is (just setup GITHUB_TOKEN)

In project's .env set connection to db
 
```
DB_CONNECTION=mysql
DB_HOST=db
DB_PORT=3306
DB_DATABASE=dev
DB_USERNAME=root
DB_PASSWORD=root
```

Add to hosts files next line (if you are using docker toolbox you must set here docker machine ip)
```
127.0.0.1 dev.laravel
```

If you are running containers first time:
```
docker-compose pull
```
This command pull images (it useful if you don't want build app image by yourself)

Now you can run containers

```
docker-compose up 
```

Your website now available at http://dev.laravel

PhpMyAdmin available at http://dev.laravel:8080

RedisCommander available at http://dev.laravel:8081

## Contents
Developer environment consists of several containers (db, pma, redis, rcm, app, nginx)

`app` container has node and composer installed

## Env Variables
You can modify env variables and build app image with needed versions of php, xdebug, node, and you can disable installation of xdebug and imagick.

Also you can change default ports for nginx, pma and rcm.

Don't forget to set github token. 
