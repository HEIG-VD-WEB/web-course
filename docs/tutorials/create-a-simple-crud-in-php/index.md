# Create a simple CRUD in PHP

You can see the code related to this tutorial on [GitHub](https://github.com/HEIG-VD-WEB/crud-product)

## Objectives

With this tutorial, you will create a simple CRUD on products in PHP. And you will initiate a database.

## Prerequisites

The following prerequisites must be filled to run this service:

- [Docker](https://docs.docker.com/get-docker/) must be installed.
- [Docker Compose](https://docs.docker.com/compose/install/) must be installed (it should be installed by default with Docker in most cases).
- [Visual Studio Code](https://code.visualstudio.com/download) must be installed.
- [Dev containers](https://code.visualstudio.com/docs/remote/containers) must be installed in Visual Studio Code.

## Steps

### Initiate the project

- Create a new repository on GitHub.
- Clone the repository on your computer.
- Open the repository in Visual Studio Code.

### Initiate the dev container

- Add devcontainer configuration files by clicking on the bottom left corner of Visual Studio Code and selecting "Remote-Containers: Add Development Container Configuration Files...".
- Select "PHP" in the list of available containers.
- Select the latest version of PHP (8.2 at the time of this commit) in the list of available versions.
- Select additional features to install:
	- Docker (Docker-in-Docker)
- Click on "OK"
- Select the "Keep Default" option.
- Add Visual Studio Code Extensions to the `devcontainer.json` by clicking on the extensions tab on the left.
	- Search for "PHP Debug", click on the gear icon (⚙️) and select "Add to devcontainer.json".
	- Search for "PHP Intelephense", click on the gear icon (⚙️) and select "Add to devcontainer.json".
	- (Optional) Search for "GitHub Copilot", click on the gear icon (⚙️) and select "Add to devcontainer.json".
- Remove unnecessary comments from the `devcontainer.json` file.

Your folder should look like that:

```bash
.
├── .devcontainer
│   └── devcontainer.json
```

### Create the database

- Create a new file named `docker-compose.yml` at the root of the project.

```yml title="docker-compose.yml"
version: '3'

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
    links:
      - db
    environment:
      PMA_HOST: db
      PMA_PORT: 3306
      PMA_ARBITRARY: 1
    restart: always
    ports:
      - 8081:80
volumes:
  db:
```

Open the Terminal in Visual Studio Code and run the following command:

```bash
docker-compose up -d
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

### Initiate the index.php file

Create a new file named `index.php` at the root of the project.

Go to the [Bootstrap starter template documentation](https://getbootstrap.com/docs/5.3/getting-started/introduction/#quick-start) and copy the following code:

```php title="index.php"
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Products CRUD</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
  </head>
  <body>
    <h1>Products CRUD</h1>
  </body>
</html>
```

Start the server by running the following command in the Terminal:

```bash
php -S localhost:8080
```

### Add a table

Go to the [Bootstrap table documentation](https://getbootstrap.com/docs/5.3/content/tables/) and copy the following code:

```html
<table class="table">
  <thead>
    <tr>
      <th scope="col">#</th>
      <th scope="col">First</th>
      <th scope="col">Last</th>
      <th scope="col">Handle</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th scope="row">1</th>
      <td>Mark</td>
      <td>Otto</td>
      <td>@mdo</td>
    </tr>
    <tr>
      <th scope="row">2</th>
      <td>Jacob</td>
      <td>Thornton</td>
      <td>@fat</td>
    </tr>
    <tr>
      <th scope="row">3</th>
      <td colspan="2">Larry the Bird</td>
      <td>@twitter</td>
    </tr>
  </tbody>
</table>
```

If your server is still running, you should see the table on [http://localhost:8080](http://localhost:8080).


### Connect to the database

Add the following code at the top of the `index.php` file:

```php
<?php

$pdo = new PDO('mysql:host=127.0.0.1;port=3306;dbname=products_crud', 'user', 'password');

$pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

$statement = $pdo->prepare('SELECT * FROM products ORDER BY create_date DESC');
$statement->execute();
$products = $statement->fetchAll(PDO::FETCH_ASSOC);

var_dump($products)

?>
```

If you refresh the page, you should see the products in the database.

### Display the products in the table

Now, let's display the products in the table.

Replace the following code:

```html
<?php

$pdo = new PDO('mysql:host=127.0.0.1;port=3306;dbname=products_crud', 'user', 'password');

$pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

$statement = $pdo->prepare('SELECT * FROM products ORDER BY create_date DESC');
$statement->execute();
$products = $statement->fetchAll(PDO::FETCH_ASSOC);
?>


<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Products CRUD</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
  </head>
  <body>
    <h1>Products CRUD</h1>

    <table class="table">
      <thead>
        <tr>
          <th scope="col">#</th>
          <th scope="col">Title</th>
          <th scope="col">Price</th>
          <th scope="col">Create Date</th>
          <th scope="col">Action</th>
        </tr>
      </thead>
      <tbody>
        <?php foreach ($products as $i => $product) { ?>
          <tr>
          <th scope="row"><?php echo $i ?></th>
          <td><?php echo $product['title'] ?></th>
          <td><?php echo $product['price'] ?></th>
          <td><?php echo $product['create_date'] ?></th>
        </tr>
        <?php } ?>
      </tbody>
    </table>
  </body>
</html>
```

If you refresh the page, you should see the products in the table.

### Add a button to modify or delete a product

Go to the [Bootstrap button documentation](https://getbootstrap.com/docs/5.3/components/buttons/) and look at **Primary** and **Danger** buttons, update the code of the table to add the buttons:

```html
    <table class="table">
      <thead>
        <tr>
          <th scope="col">#</th>
          <th scope="col">Title</th>
          <th scope="col">Price</th>
          <th scope="col">Create Date</th>
          <th scope="col">Action</th>
        </tr>
      </thead>
      <tbody>
        <?php foreach ($products as $i => $product) { ?>
          <tr>
          <th scope="row"><?php echo $i ?></th>
          <td><?php echo $product['title'] ?></th>
          <td><?php echo $product['price'] ?></th>
          <td><?php echo $product['create_date'] ?></th>
          <td>
            <button type="button" class="btn btn-sm btn-primary">Edit</button>
            <button type="button" class="btn btn-sm btn-danger">Delete</button>
          </td>
        </tr>
        <?php } ?>
      </tbody>
    </table>
```

If you refresh the page, you should see the buttons in the table.

### Create a form for the product

Add a button to create a product:

```html
		<h1>Products CRUD</h1>

		<p>
			<a href="create.php" class="btn btn-success">Create Product</a>
		</p>
```

Create a `create.php` file at the root of the project, this step use the [Bootstrap form documentation](https://getbootstrap.com/docs/4.0/components/forms/):

```html title="create.php"
<?php

$pdo = new PDO('mysql:host=127.0.0.1;port=3306;dbname=products_crud', 'user', 'password');
$pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

?>
<?php

$pdo = new PDO('mysql:host=127.0.0.1;port=3306;dbname=products_crud', 'user', 'password');
$pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

?>

<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Products CRUD</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
  </head>
<body>
<h1>Create new Product</h1>

<form>
    <div class="form-group">
        <label>Product title</label>
        <input type="text" class="form-control" value="">
    </div>
    <div class="form-group">
        <label>Product description</label>
        <textarea class="form-control"></textarea>
    </div>
    <div class="form-group">
        <label>Product price</label>
        <input type="number" step=".01" class="form-control" value="">
    </div>
    <button type="submit" class="btn btn-primary">Submit</button>
</form>

</body>
</html>
```

If you refresh the page, you should see the form. It is not quite lisible. Add a `style.css` file.

```css title="style.css"
body {
		padding: 50px;
}
```

Add the following line in the `head` of the `create.php` and the `index.php` file:

```html
<link rel="stylesheet" href="style.css">
```

Nice ! Now, let's add the product in the database.

### Make the form create some product informations

If you click on the submit button, nothing happens. that's because the form is not submitted. Let's add the `method` and `action` attributes to the form:

```html
<form action="" method="get">
```

Still nothing happens. Nothing is sent to the server. Let's add the `name` attribute to the inputs:

```html
<form action="" method="get">
    <div class="form-group">
        <label>Product title</label>
        <input type="text" name="title" class="form-control" value="">
    </div>
    <div class="form-group">
        <label>Product description</label>
        <textarea class="form-control" name="description"></textarea>
    </div>
    <div class="form-group">
        <label>Product price</label>
        <input type="number" step=".01" name="price" class="form-control" value="">
    </div>
    <button type="submit" class="btn btn-primary">Submit</button>
</form>
```

If you refresh the page, you should see the form. If you click on the submit button, you should see the parameters in the URL. It should look like that:

```bash
http://localhost:8080/create.php?title=&description=&price=
```

If you fill the form and click on the submit button, you should see the parameters in the URL. It should look like that:

```bash
http://localhost:8080/create.php?title=Fairphone+4&description=&price=350
```

This is how we can get the `get` informations. Now in we need to get the informations in the PHP code. Let's update the following code at the top of the `create.php` file:

```php title="create.php"
<?php

$pdo = new PDO('mysql:host=127.0.0.1;port=3306;dbname=products_crud', 'user', 'password');
$pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

echo '<pre>';
var_dump($_GET);
echo '<pre>';

?>
```

We see that the parameters are in the URL so it is not secure to pass sensitive informations like passwords.

That's because the form is submitted with the `GET` method. Let's change it to `POST`:

```html title="create.php"
<form action="" method="post">
```

And update the PHP code to get the `POST` informations:

```php title="create.php"
echo '<pre>';
var_dump($_POST);
echo '<pre>';
```

If you refresh the page, you should see the form. If you fill the form and click on the submit button, the parameters should not be in the URL. But the `var_dump` show you that the informations are in the `$_POST` variable.

### Add the product in the database

If you try to get the informations from the `$_POST` variable, you will see that the `$_POST` variable is empty. That's because the form is not submitted. 

```php title="create.php"
<?php

$pdo = new PDO('mysql:host=127.0.0.1;port=3306;dbname=products_crud', 'user', 'password');
$pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

$title = '';
$description = '';
$price = '';
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
  $title = $_POST['title'];
  $description = $_POST['description'];
  $price = $_POST['price'];

  $statement = $pdo->prepare("INSERT INTO products (title, description, price, create_date)
  VALUES (:title, :description, :price, :date)");
  $statement->bindValue(':title', $title);
  $statement->bindValue(':description', $description);
  $statement->bindValue(':price', $price);
  $statement->bindValue(':date', date('Y-m-d H:i:s'));

  $statement->execute();
}
?>
```

Now try to create a product. You should see the product in the database.

### Add a validation

You need some validation if the title is empty for example. You need an array to stock the errors:

```php title="create.php"
<?php

$pdo = new PDO('mysql:host=127.0.0.1;port=3306;dbname=products_crud', 'user', 'password');
$pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

$errors = [];

$title = '';
$description = '';
$price = '';
if ($_SERVER['REQUEST_METHOD'] === 'POST') {

    $title = $_POST['title'];
    $description = $_POST['description'];
    $price = $_POST['price'];

    if (!$title) {
        $errors[] = 'Product title is required';
    }

    if (!$price) {
        $errors[] = 'Product price is required';
    }

    if (empty($errors)) {
        $statement = $pdo->prepare("INSERT INTO products (title, description, price, create_date)
                VALUES (:title, :description, :price, :date)");
        $statement->bindValue(':title', $title);
        $statement->bindValue(':description', $description);
        $statement->bindValue(':price', $price);
        $statement->bindValue(':date', date('Y-m-d H:i:s'));

        $statement->execute();
    }

}
```

And you need to add code to display the errors:

```php title="create.php"
<h1>Create new Product</h1>

<?php if (!empty($errors)): ?>
    <div class="alert alert-danger">
        <?php foreach ($errors as $error): ?>
            <div><?php echo $error ?></div>
        <?php endforeach; ?>
    </div>
<?php endif; ?>

<form action="" method="post">
```

Good ! Now, let's delete a product.

### Delete a product

Modify the **Delete** button in the `index.php` file:

```html title="index.php"
          <td>
            <button type="button" class="btn btn-sm btn-primary">Edit</button>
            <a href="delete.php?id=<?php echo $product['id']?>" type="button" class="btn btn-sm btn-danger">Delete</a>
          </td>
```

If you go to the [http://localhost:8080](http://localhost:8080){:target="_blank"} page, you should see the **Delete** button. If you click on it, you should see the `id` in the URL.

And you get an error because the `delete.php` file does not exist. Let's create it.

Create a `delete.php` file at the root of the project:

```php title="delete.php"
<?php

$pdo = new PDO('mysql:host=127.0.0.1;port=3306;dbname=products_crud', 'user', 'password');
$pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

$id = $_GET_['id'] ?? null;
if (!$id) {
    header('Location: index.php');
    exit;
}

$statement = $pdo->prepare('DELETE FROM products WHERE id = :id');
$statement->bindValue(':id', $id);
$statement->execute();

header('Location: index.php');
```

If you go to the [http://localhost:8080](http://localhost:8080){:target="_blank"} page, you should see the **Delete** button. If you click on it, you should see the product deleted.

### Edit a product

Update the `index.php` file to 

```html title="index.php"
          <td>
            <a href="update.php?id=<?php echo $product['id'] ?>" class="btn btn-sm btn-primary">Edit</a>
            <a href="delete.php?id=<?php echo $product['id']?>" type="button" class="btn btn-sm btn-danger">Delete</a>
          </td>
```

Create a `update.php` file at the root of the project:

```php title="update.php"
<?php

$id = $_GET['id'] ?? null;
if (!$id) {
    header('Location: index.php');
    exit;
}

$pdo = new PDO('mysql:host=127.0.0.1;port=3306;dbname=products_crud', 'user', 'password');
$pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

$statement = $pdo->prepare('SELECT * FROM products WHERE id = :id');
$statement->bindValue(':id', $id);
$statement->execute();
$product = $statement->fetch(PDO::FETCH_ASSOC);


$title = $product['title'];
$description = $product['description'];
$price = $product['price'];

if ($_SERVER['REQUEST_METHOD'] === 'POST') {

    $title = $_POST['title'];
    $description = $_POST['description'];
    $price = $_POST['price'];

    if (!$title) {
        $errors[] = 'Product title is required';
    }

    if (!$price) {
        $errors[] = 'Product price is required';
    }

    if (empty($errors)) {
        $statement = $pdo->prepare("UPDATE products SET title = :title,
                                        description = :description, 
                                        price = :price WHERE id = :id");
        $statement->bindValue(':title', $title);
        $statement->bindValue(':description', $description);
        $statement->bindValue(':price', $price);
        $statement->bindValue(':id', $id);

        $statement->execute();
        header('Location: index.php');
    }

}

?>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Products CRUD</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <link rel="stylesheet" href="style.css">
</head>
<body>
<p>
    <a href="index.php" class="btn btn-default">Back to products</a>
</p>
<h1>Update Product: <b><?php echo $product['title'] ?></b></h1>

<?php if (!empty($errors)): ?>
    <div class="alert alert-danger">
        <?php foreach ($errors as $error): ?>
            <div><?php echo $error ?></div>
        <?php endforeach; ?>
    </div>
<?php endif; ?>

<form method="post" enctype="multipart/form-data">
    <div class="form-group">
        <label>Product title</label>
        <input type="text" name="title" class="form-control" value="<?php echo $title ?>">
    </div>
    <div class="form-group">
        <label>Product description</label>
        <textarea class="form-control" name="description"><?php echo $description ?></textarea>
    </div>
    <div class="form-group">
        <label>Product price</label>
        <input type="number" step=".01" name="price" class="form-control" value="<?php echo $price ?>">
    </div>
    <button type="submit" class="btn btn-primary">Submit</button>
</form>

</body>
</html>
```

Yey !! You can update the database !

## Conclusion

You know how to create a simple CRUD in PHP. You can now create a CRUD for your own project.


## Sources

[Get Bootstrap - Get started with Bootstrap](https://getbootstrap.com/docs/5.3/getting-started/introduction/)
[PHP For Absolute Beginners | 6.5 Hour Course](https://www.youtube.com/watch?v=dQw4w9WgXcQ)
