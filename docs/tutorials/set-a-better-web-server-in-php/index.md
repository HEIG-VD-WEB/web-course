# Set a better Web server in PHP up

This is a follow-up tutorial for the [Create a simple CRUD in PHP](/web-course/tutorials/create-a-simple-crud-in-php/) tutorial.

The code of this tutorial is available on [GitHub](https://github.com/HEIG-VD-WEB/crud-product-xampp){:target="_blank"}.

## Objectives

With this tutorial, you will be able to test new ways of running a Web server locally and for production.

## Prerequisites

- [Docker](https://docs.docker.com/get-docker/) must be installed.
- [Docker Compose](https://docs.docker.com/compose/install/) must be installed (it should be installed by default with Docker in most cases).
- [Visual Studio Code](https://code.visualstudio.com/download) must be installed.
- [Dev containers](https://code.visualstudio.com/docs/remote/containers) must be installed in Visual Studio Code.

## Steps

### Open the "Create a simple CRUD in PHP" repository

```
git clone https://github.com/HEIG-VD-WEB/crud-product.git
cd crud-product
code . && exit
```

### Set the project up

Open the devcontainer by clicking on the bottom left corner of Visual Studio Code and selecting "Remote-Containers: Reopen in Container".

Wait for the container to be built and the project to be opened.

Open a terminal in Visual Studio Code and run the following command:

```
docker compose up -d
```

Open your browser and go to [http://localhost:8081](http://localhost:8081). You should see the phpMyAdmin interface.

Enter the following credentials:

- Server: db
- Username: user
- Password: password

Click on "Go".

In the database list, you should see the `products_crud` database. Select it.

Create a new table named `products` with the following 5 columns:

- id: int(11) - Primary - Auto Increment
- title: varchar(512)
- description: longtext - Null
- price: decimal(10,2)
- create_date: datetime

Ok, the table is created. Now, let's create a new product.

Click on the "SQL" tab.

Enter the following SQL query:

```sql
INSERT INTO `products` (`id`, `title`, `description`, `price`, `create_date`) VALUES (NULL, 'Fairphone 3s', NULL, '300', '2023-11-01 10:42:24.000000'), (NULL, 'Fairphone 4', NULL, '350', '2023-11-01 10:42:24.000000');
```

Click on "Go".

Go back to the "Browse" tab. You should see the 2 products you just created.

Ok, now that we have a database with some data, let's see how we can run the project.

Open a new terminal in Visual Studio Code and run the following command:

```
php -S localhost:8080
```

Open your browser and go to [http://localhost:8080](http://localhost:8080). You should see the list of products.

### Use a containerized Web server

Stop the Web server by pressing `Ctrl + C` in the terminal.

Modify the `docker-compose.yml` file to add a new service named `web`:

```yml hl_lines="26-33"
version: '3.8'

services:
  db:
    image: mysql:8.2.0
    container_name: db
    environment:
      MYSQL_ROOT_PASSWORD: password
      MYSQL_DATABASE: products_crud
      MYSQL_USER: user
      MYSQL_PASSWORD: password
    ports:
      - 3306:3306
    volumes:
      - ./db:/var/lib/mysql
  pma:
    image: phpmyadmin/phpmyadmin
    container_name: pma
    environment:
      PMA_HOST: db
      PMA_PORT: 3306
      PMA_ARBITRARY: 1
    restart: always
    ports:
      - 8081:80
  web:
    image: tomsik68/xampp
    container_name: web
    ports:
      - 41061:22
      - 41062:80
    volumes:
      - ./www:/www
volumes:
  db:
```

Add a folder `www` to your project, and move all the `.php` and the `.css` files in it.

Your project should look like this:

```
.
├── .devcontainer
│   ├── devcontainer.json
│   ├── docker-compose.yml
│   └── devcontainer.json
├── db
│   └── ...
├── docker-compose.yml
├── README.md
├── .gitignore
└── www
    ├── create.php
    ├── delete.php
    ├── index.php
    ├── style.css
    └── update.php
```

### Make it work !

Run the following command to start the containers:

```
docker compose up -d
```

Open your browser and go to [http://localhost:41062/www/](http://localhost:41062/www). You should see the list of products.

Oh no !

An error is displayed:

```
Fatal error: Uncaught PDOException: SQLSTATE[HY000] [1045] Access denied for user 'user'@'localhost' (using password: YES) in /www/index.php:3 Stack trace: #0 /www/index.php(3): PDO->__construct('mysql:host=127....', 'user', 'password') #1 {main} thrown in /www/index.php on line 3
```

The database is not accessible from the container. As every container was created in the same network, we can use the name of the service as the host.

Change all the `127.0.0.1` to `db` in the `.php` files.

```php
$pdo = new PDO('mysql:host=db;port=3306;dbname=products_crud', 'user', 'password');
```

Refresh the page. You should see the list of products.

### Conclusion

You know how to set a simple web server up ! And you can reproduce every step of this tutorial with any PHP project.

## Sources

- [Docker Hub - tomsik68/xampp](https://hub.docker.com/r/tomsik68/xampp)
