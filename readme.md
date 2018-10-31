# Developer environment based on Docker for Laravel

## Usage

Go to project root directory (it must be under git) and add new submodule

```
    git submodule add https://github.com/omadonex/laradock.git
```

Copy .env.example to .env you can leave its contents as is

In project's .env set connection to db
 
```
DB_CONNECTION=mysql
DB_HOST=db
DB_PORT=3306
DB_DATABASE=dev
DB_USERNAME=user
DB_PASSWORD=pass
```

Add to hosts files next line (if you are using docker toolbox you must set here docker machine ip)
```
    127.0.0.1 dev.laravel
```

Now you can run containers (docker-compose.yml located inside new folder for submodule)

```
    docker-compose up 
```

Your website now available at http://dev.laravel

PhpMyAdmin available at http://dev.laravel:8080

## Contents
Developer environment consists of several containers (nginx, mysql, app, pma)

`app` container has node and composer installed (node version you can set in .env file) 
