# Play with PHP Basis

## Objectives

In this tutorial, you will try and execute PHP code in a Dev container.

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

- Create a new file named `index.php` in the root of your project.
- Add the following code in the file:

```php title="index.php"
<?php echo 'Hello World'; ?>
```

Your folder should look like that:

```bash
.
├── .devcontainer
│   └── devcontainer.json
│   index.php
```

### Run the project

- Open the command palette in Visual Studio Code by pressing `Ctrl+Shift+P` or `Cmd+Shift+P`.
- Select "Remote-Containers: Reopen in Container".
- Open the terminal in Visual Studio Code.
- Run the following command to start the server:

```bash
php -S localhost:8080
```

### Use some variables

We are going to check what sort of browser the user is using. To do so, we are going to use the `$_SERVER` variable. This variable is a superglobal, which means that it is always available in all scopes.

??? info
	[`$_SERVER` documentation](https://www.php.net/manual/en/reserved.variables.server.php){:target="_blank"}`
	[superglobals documentation](https://www.php.net/manual/en/language.variables.superglobals.php){:target="_blank"}

Update the `index.php` file with the following code:

```php title="index.php"
<?php
echo $_SERVER['HTTP_USER_AGENT'];
?>
```

If you are still running the server, you should see something like that on Firefox:

```bash
Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:109.0) Gecko/20100101 Firefox/118.0
```

or something lite that on Chromium:

```bash
 Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36
```

??? info
	The reason you're getting similar user agent strings across different browsers is because modern web browsers tend to use a common user agent string format for compatibility and security reasons. The user agent string provides information about the browser and its version, the operating system, and sometimes other details.

	For instance, Firefox and Chrome both include information like "Mozilla/5.0" because they are designed to be compatible with websites that might check for the presence of the "Mozilla" identifier in the user agent string, a practice that dates back to the early days of the web.

	[Source](https://webaim.org/blog/user-agent-string-history/){:target="_blank"}

### Use control structures and functions

You are going to change the behavior of the page depending on the browser the user is using.

Update the `index.php` file with the following code:

```php title="index.php"
<?php
if (str_contains($_SERVER['HTTP_USER_AGENT'], 'Firefox')) {
    echo 'You are using Firefox.';
}
?>
```

If you are still running the server, you should see something like that on Firefox:

```bash
You are using Firefox.
```

or nothing on Chromium.

And now, you will add a condition for Chrome:

```php title="index.php"
<?php
if (str_contains($_SERVER['HTTP_USER_AGENT'], 'Firefox')) {
		echo 'You are using Firefox.';
} elseif (str_contains($_SERVER['HTTP_USER_AGENT'], 'Chromium')) {
		echo 'You are using Chromium.';
}
?>
```

You will take this a step further and jump in and out of PHP mode even in the middle of a PHP block. This is useful if you want to mix HTML and PHP code.

Update the `index.php` file with the following code:

```php title="index.php"
<?php
if (str_contains($_SERVER['HTTP_USER_AGENT'], 'Firefox')) {
?>
		You are using Firefox with PHP mode in block in the code.
<?php
} elseif (str_contains($_SERVER['HTTP_USER_AGENT'], 'Chromium')) {
?>
		You are using Chromium with PHP mode in block in the code.
<?php
}
?>
```

You can also use functions to make your code more readable.

Update the `index.php` file with the following code:

```php title="index.php"
<?php
function isFirefox() {
		return str_contains($_SERVER['HTTP_USER_AGENT'], 'Firefox');
}

function isChrome() {
		return str_contains($_SERVER['HTTP_USER_AGENT'], 'Chrome');
}

if (isFirefox()) {
?>
		You are using Firefox and you are using functions.
<?php
} elseif (isChrome()) {
?>
		You are using Chrome and you are using functions.
<?php
}
?>
```

### Variables and constants

You are going to use variables.

Update the `index.php` file with the following code:

```php title="index.php"
<?php
$firefox = 'Firefox';
$chrome = 'Chrome';


function isFirefox() {
		return str_contains($_SERVER['HTTP_USER_AGENT'], $firefox);
}

function isChrome() {
		return str_contains($_SERVER['HTTP_USER_AGENT'], $chrome);
}

if (isFirefox()) {
?>
		You are using <?php echo $firefox; ?> and you are using variables.
<?php
} elseif (isChrome()) {
?>
		You are using <?php echo $chrome; ?> and you are using variables.
<?php
}
?>
```

This script will generate an undefined variable error. This is because the variables `$firefox` and `$chrome` are not defined in the scope of the functions `isFirefox()` and `isChrome()`. To fix this, you will use the `global` keyword.

Update the `index.php` file with the following code:

```php title="index.php"
<?php
$firefox = 'Firefox';
$chrome = 'Chrome';

function isFirefox() {
		global $firefox;
		return str_contains($_SERVER['HTTP_USER_AGENT'], $firefox);
}

function isChrome() {
		global $chrome;
		return str_contains($_SERVER['HTTP_USER_AGENT'], $chrome);
}

if (isFirefox()) {
?>
		You are using <?php echo $firefox; ?> and you are using variables.
<?php
} elseif (isChrome()) {
?>
		You are using <?php echo $chrome; ?> and you are using variables.
<?php
}
?>
```

You can use arguments to pass variables to functions. Doing so, removing the need for the `global` keyword and repeating the same code.

Update the `index.php` file with the following code:

```php title="index.php"
<?php
function isBrowser($browser) {
		return str_contains($_SERVER['HTTP_USER_AGENT'], $browser);
}

if (isBrowser('Firefox')) {
?>
		You are using Firefox, your code is more readable and you use arguments.
<?php
} elseif (isBrowser('Chrome')) {
?>
		You are using Chrome, your code is more readable and you use arguments.
<?php
}
?>
```

Imagine that you don't want the variable `$firefox` and `$chrome` to be changed. You can use constants instead.

Update the `index.php` file with the following code:

```php title="index.php"
<?php
define('FIREFOX', 'Firefox');
define('CHROME', 'Chrome');

function isBrowser($browser) {
		return str_contains($_SERVER['HTTP_USER_AGENT'], $browser);
}

if (isBrowser(FIREFOX)) {
?>
		You are using <?php echo FIREFOX; ?>, your code is more readable and you use constants.
<?php
} elseif (isBrowser(CHROME)) {
?>
		You are using <?php echo CHROME; ?>, your code is more readable and you use constants.
<?php
}
?>
```

### Switch

You can use the `switch` statement to make your code more readable.

Update the `index.php` file with the following code:

```php title="index.php"
<?php
define('FIREFOX', 'Firefox');
define('CHROME', 'Chrome');

function isBrowser($browser) {
		return str_contains($_SERVER['HTTP_USER_AGENT'], $browser);
}

switch (true) {
		case isBrowser(FIREFOX):
?>
		You are using <?php echo FIREFOX; ?>, your code is more readable and you use switch.
<?php
				break;
		case isBrowser(CHROME):
?>
		You are using <?php echo CHROME; ?>, your code is more readable and you use switch.
<?php
				break;
}
?>
```

More readable ? Right,... but now you know how to use `switch` statements.

## Conclusion

You have successfully run a PHP script in a Dev container. You have also learned how to use variables, control structures, and functions.

## Source

- [PHP Manual](https://www.php.net/manual/en/index.php){:target="_blank"}
- [PHP Manual - Something Useful](https://www.php.net/manual/en/tutorial.useful.php){:target="_blank"}
- [Traversy Media - PHP For Absolute Beginners](https://www.youtube.com/watch?v=2eebptXfEvw){:target="_blank"}
