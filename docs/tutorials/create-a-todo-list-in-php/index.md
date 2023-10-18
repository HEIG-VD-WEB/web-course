# Create a To Do list in PHP [NOT FINISHED]

## Objectives

TODO

## Prerequisites

The following prerequisites must be filled to run this service:

- [Docker](https://docs.docker.com/get-docker/) must be installed.
- [Docker Compose](https://docs.docker.com/compose/install/) must be installed (it should be installed by default with Docker in most cases).
- [Visual Studio Code](https://code.visualstudio.com/download) must be installed.

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

```php title="index.php"
<!DOCTYPE html>
<html>
<head>
    <title>Simple Calculator</title>
</head>
<body>
    <h1>Simple Calculator</h1>
    <form method="post" action="">
        <input type="text" name="num1" placeholder="Enter number 1" required>
        <input type="text" name="num2" placeholder="Enter number 2" required>
        <select name="operator">
            <option value="add">Addition (+)</option>
            <option value="subtract">Subtraction (-)</option>
            <option value="multiply">Multiplication (*)</option>
            <option value="divide">Division (/)</option>
        </select>
        <input type="submit" name="calculate" value="Calculate">
    </form>

    <?php
    if (isset($_POST['calculate'])) {
        $num1 = $_POST['num1'];
        $num2 = $_POST['num2'];
        $operator = $_POST['operator'];

        switch ($operator) {
            case 'add':
                $result = $num1 + $num2;
                break;
            case 'subtract':
                $result = $num1 - $num2;
                break;
            case 'multiply':
                $result = $num1 * $num2;
                break;
            case 'divide':
                if ($num2 == 0) {
                    echo "Division by zero is not allowed.";
                } else {
                    $result = $num1 / $num2;
                }
                break;
            default:
                echo "Invalid operator.";
        }

        echo "Result: $result";
    }
    ?>
</body>
</html>
```

### Consistency and Session

```php title="index.php"
<?php
session_start();

if (!isset($_SESSION['todoList'])) {
    $_SESSION['todoList'] = [];
}

if (isset($_POST['addTask'])) {
    $task = $_POST['task'];
    if (!empty($task)) {
        array_push($_SESSION['todoList'], $task);
    }
}

if (isset($_GET['remove'])) {
    $index = $_GET['remove'];
    if (isset($_SESSION['todoList'][$index])) {
        unset($_SESSION['todoList'][$index]);
    }
}
?>

<!DOCTYPE html>
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
    $todoList = $_SESSION['todoList'];

    if (!empty($todoList)) {
        echo "<h2>Tasks</h2>";
        echo "<ul>";
        foreach ($todoList as $index => $task) {
            echo "<li>$task <a href='index.php?remove=$index'>Remove</a></li>";
        }
        echo "</ul>";
    }
    ?>
</body>
</html>
```

## Sources

- [Youtube - PHP For Absolute Beginners | 6.5 Hour Course ](https://www.youtube.com/watch?v=2eebptXfEvw)


