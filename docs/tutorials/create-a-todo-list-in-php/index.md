# Create a To Do list in PHP

## Objectives

With this tutorial, you will create a simple To Do list in PHP.

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

### Create the index.php file

First, you will create a simple HTML form to add a new task to the To Do list.

Create a new file named `index.php` in the root of your project.

Add the following code in the file:

```html title="index.php"
<html>
<head>
    <title>Todo List</title>
</head>
<body>
    <h1>Todo List</h1>
    
    <form method="post" action="">
        <input type="text" name="task" placeholder="Enter a new task" required>
        <input type="submit" name="addTask" value="Add Task">
    </form>
</body>
</html>
```

Your project should look like that:

```bash
.
├── .devcontainer
│   └── devcontainer.json
│   index.php
```

You can now run the project. 

Open the Terminal in Visual Studio Code and run the following command:

```bash
php -S localhost:8080
```

Open your browser and go to [http://localhost:8080](http://localhost:8080){:target="_blank"}.

### Add some style

Create a new file named `style.css` in the root of your project.

```css title="style.css"
body {
  font-family: Arial, sans-serif;
  background-color: #f5f5f5;
  text-align: center;
  margin: 0;
  padding: 0;
}

h1 {
  background-color: #333;
  color: #fff;
  padding: 20px 0;
  margin: 0;
}

form {
  margin: 20px 0;
}

form input[type="text"] {
  width: 60%;
  padding: 10px;
}

form input[type="submit"] {
  padding: 10px 20px;
  background-color: #333;
  color: #fff;
  border: none;
  cursor: pointer;
}

form input[type="submit"]:hover {
  background-color: #555;
}

ul {
  list-style-type: none;
  padding: 0;
}

li {
  background-color: #fff;
  border: 1px solid #ddd;
  margin: 10px 0;
  padding: 10px;
  display: flex;
  justify-content: space-between;
  align-items: center;
}

a {
  text-decoration: none;
  color: #e74c3c;
}

a:hover {
  text-decoration: underline;
}
```

Update the `index.php` file to add the style:

```html title="index.php" hl_lines="4"
<html>
<head>
    <title>Todo List</title>.
		<link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
    <h1>Todo List</h1>
    
    <form method="post" action="">
        <input type="text" name="task" placeholder="Enter a new task" required>
        <input type="submit" name="addTask" value="Add Task">
    </form>
</body>
</html>
```

!!! info
	You might have a message like "To display this page, Firefox must send information that will repeat any action (such as a search or order confirmation) that was performed earlier.". This is because the form is submitted and the page is refreshed. So the last action is repeated. You can click on "Resend" to confirm the action. This is normal behavior.

### Handle the form

Update the `index.php` file to handle the form:

```php title="index.php" hl_lines="14-48"
<html>
<head>
    <title>Todo List</title>
		<link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
    <h1>Todo List</h1>
    
    <form method="post" action="">
        <input type="text" name="task" placeholder="Enter a new task" required>
        <input type="submit" name="addTask" value="Add Task">
    </form>

    <?php
    $todoList = []; // (1)!
    
    /*
      Add the task to the list if the form is submitted.
    */
    if (isset($_POST['addTask'])) { // (2)!
        $task = $_POST['task']; // (3)!
        if (!empty($task)) { // (4)!
            array_push($todoList, $task); // (5)!
        }
    }

    /*
      Display the list if it is not empty.
    */
    if (!empty($todoList)) { // (6)!
        echo "<h2>Tasks</h2>";
        echo "<ul>";
        foreach ($todoList as $index => $task) { // (7)!
            echo "<li>$task <a href='index.php?remove=$index'>Remove</a></li>"; // (8)!
        }
        echo "</ul>";
    }

    /*
      Remove the task from the list if the remove parameter is set.
    */
    if (isset($_GET['remove'])) { // (9)!
        $index = $_GET['remove']; // (10)!
        if (isset($todoList[$index])) { // (11)!
            unset($todoList[$index]); // (12)!
        }
    }
    ?>
</body>
</html>
```

1. Initialize the list.
2. Check if the form is submitted.
3. Get the task from the form.
4. Check if the task is not empty.
5. Add the task to the list.
6. Check if the list is not empty.
7. Loop through the list.
8. Display the task and a link to remove it.
9. Check if the remove parameter is set.
10. Get the index of the task to remove.
11. Check if the task exists.
12. Remove the task from the list.

If your server is still running, after refreshing the page, you can add one task to the list and delete it.

But why can't you add more than one task? Because when you click on the "Add Task" button, the form is submitted and the page is refreshed. The list is then empty again. There is no persistence.

### Persistency and Session

To solve this problem, you will use sessions. Sessions are a simple way to store data for individual users against a unique session ID. This can be used to persist state information between page requests.

Update the `index.php` file to add persistence:

```php title="index.php" hl_lines="1-4 19-21 29 36 39 50-51"
<?php
session_start(); // (1)!
?>

<html>
<head>
    <title>Todo List</title>
		<link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
    <h1>Todo List</h1>
    
    <form method="post" action="">
        <input type="text" name="task" placeholder="Enter a new task" required>
        <input type="submit" name="addTask" value="Add Task">
    </form>

    <?php
    if (!isset($_SESSION['todoList'])) { // (2)!
        $_SESSION['todoList'] = []; // (8)!
    }
    
    /*
      Add the task to the list if the form is submitted.
    */
    if (isset($_POST['addTask'])) {
        $task = $_POST['task'];
        if (!empty($task)) {
            array_push($_SESSION['todoList'], $task); // (3)!
        }
    }

    /*
      Display the list if it is not empty.
    */
    if (!empty($_SESSION['todoList'])) { // (4)!
        echo "<h2>Tasks</h2>";
        echo "<ul>";
        foreach ($_SESSION['todoList'] as $index => $task) { // (5)!
            echo "<li>$task <a href='index.php?remove=$index'>Remove</a></li>";
        }
        echo "</ul>";
    }

    /*
      Remove the task from the list if the remove parameter is set.
    */
    if (isset($_GET['remove'])) {
        $index = $_GET['remove'];
        if (isset($_SESSION['todoList'][$index])) { // (6)!
            unset($_SESSION['todoList'][$index]); // (7)!
        }
        // Redirect to remove the 'remove' parameter from the URL
        header("Location: index.php");
        exit();
    }
    ?>
</body>
</html>
```

1. Start new or resume existing session. [PHP manual - session_start](https://www.php.net/manual/en/function.session-start.php)
2. Check if the session variable is set.
3. Add the task to the session variable.
4. Check if the session variable is not empty.
5. Loop through the session variable.
6. Check if the session variable is set.
7. Remove the task from the session variable.
8. Initialize the session variable.

If your server is still running, after refreshing the page, you can add multiple tasks to the list and delete them.

But, when you delete a task, you can no longer add tasks to the list. This is because the `remove` parameter is still in the URL. You need to redirect the user to remove it.

Update the `index.php` file to redirect the user:

```php title="index.php" hl_lines="4-16"
<?php
session_start();

/*
    Remove the task from the list if the remove parameter is set.
*/
if (isset($_GET['remove'])) {
    $index = $_GET['remove'];
    if (isset($_SESSION['todoList'][$index])) {
        unset($_SESSION['todoList'][$index]);
    }

    // Redirect to remove the 'remove' parameter from the URL
    header("Location: index.php"); // (1)!
    exit(); // (2)!
}
?>

<html>
<head>
    <title>Todo List</title>
		<link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
    <h1>Todo List</h1>
    
    <form method="post" action="">
        <input type="text" name="task" placeholder="Enter a new task" required>
        <input type="submit" name="addTask" value="Add Task">
    </form>

    <?php
    if (!isset($_SESSION['todoList'])) {
        $_SESSION['todoList'] = [];
    }
    
    /*
      Add the task to the list if the form is submitted.
    */
    if (isset($_POST['addTask'])) {
        $task = $_POST['task'];
        if (!empty($task)) {
            array_push($_SESSION['todoList'], $task);
        }
    }

    /*
      Display the list if it is not empty.
    */
    if (!empty($_SESSION['todoList'])) {
        echo "<h2>Tasks</h2>";
        echo "<ul>";
        foreach ($_SESSION['todoList'] as $index => $task) {
            echo "<li>$task <a href='index.php?remove=$index'>Remove</a></li>";
        }
        echo "</ul>";
    }
    ?>
</body>
</html>
```

1. Redirect to remove the 'remove' parameter from the URL.
2. Exit the script to prevent the rest of the page from loading.

## Conclusion

You have created a simple To Do list in PHP.

## Sources

- [ChatGPT](https://chat.openai.com/){:target="_blank"}
- [Copilot](https://copilot.github.com/){:target="_blank"}
- [Youtube - PHP For Absolute Beginners | 6.5 Hour Course ](https://www.youtube.com/watch?v=2eebptXfEvw)


