# PHP

## What is PHP ?

PHP, which stands for "PHP: Hypertext Preprocessor" is a widely-used Open Source general-purpose scripting language that is especially suited for web development and can be embedded into HTML. It is an interpreted language, i.e. there is no need for compilation.

## Why should you learn PHP ?

- Multi-purpose language
  - Simple websites
  - Complex websites
  - REST APIs
  - Command line scripts
  - Image processing
- Easy to learn
- Easy to set up
- Large community
- Open source
- PHP CMSs
  - WordPress
  - Drupal
  - Magento
- PHP Framework
  - Laravel
  - Symfony
  - CodeIgniter
- High demand on the job market

### Why you should not use PHP ?

- Building real-time applications
- Building desktop applications
- AI and machine learning

## PHP syntax

### Comments

```php
<?php
// This is a single line comment

/*
This is a multi-line comment
*/
?>
```

### Variables

PHP variables start with a dollar sign `$` followed by the name of the variable.

Variable are not typed, i.e. you don't need to specify the type of the variable.

```php
<?php
$name = 'John';
$age = 30;
$isMale = true;
$height = 1.85;
$salary = null;
?>
```

### Strings

PHP strings can be defined with single quotes `'` or double quotes `"`.

```php
<?php
// Concatenation
echo 'Hello, my name is ' . $name . ' and I am ' . $age . '.';
echo "Hello, my name is $name and I am $age.";

// String functions
echo strlen($name); // 4
echo strtoupper($name); // JOHN
echo strtolower($name); // john
echo str_replace('J', 'H', $name); // Hohn
echo str_replace('o', '', $name); // Jhn
echo substr($name, 1, 3); // ohn
?>
```

### Numbers

PHP numbers can be integers or floats.

```php
<?php
$num = 10;
echo $num . '<br>'; // 10
$num++;
echo $num . '<br>'; // 11
$num--;
echo $num . '<br>'; // 10
$num += 25;
echo $num . '<br>'; // 35
echo abs(-100) . '<br>'; // 100
echo pow(2, 4) . '<br>'; // 16
echo sqrt(144) . '<br>'; // 12

// Order of operations
echo 10 + 3 * 5 . '<br>'; // 25
echo (10 + 3) * 5 . '<br>'; // 65

// Increment / Decrement operators
echo $num++ . '<br>'; // 35
echo ++$num . '<br>'; // 37

// Number functions
echo floor(2.4) . '<br>'; // 2
echo ceil(2.4) . '<br>'; // 3
echo round(2.4) . '<br>'; // 2
echo round(2.6) . '<br>'; // 3
echo round(2.5) . '<br>'; // 3

// Formatting numbers
echo number_format(123456789, 2); // 123,456,789.00

echo is_float(1.25) . '<br>'; // 1
echo is_float(1) . '<br>'; //
echo in_int(1.25) . '<br>'; //

?>
```

### Arrays

PHP arrays can be defined with the `array()` function or with square brackets `[]`.

```php
<?php
// Create an array
$peopleOne = array('Kevin', 'Jeremy', 'Sara');
$peopleTwo = ['Kevin', 'Jeremy', 'Sara', 'Karen'];
$ages = [20, 30, 40, 50];

// Print the whole array
print_r($peopleOne); // Array ( [0] => Kevin [1] => Jeremy [2] => Sara )

// Get element by index
echo $peopleOne[1]; // Jeremy

// Set element by index
$peopleOne[1] = 'John';
echo $peopleOne[1]; // John

// Add element
$peopleOne[] = 'Mary';

// Print the whole array
print_r($peopleOne); // Array ( [0] => Kevin [1] => John [2] => Sara [3] => Mary )

// Add element at the beginning of the array
array_unshift($peopleOne, 'Bob');

// Remove element from the end of the array
array_pop($peopleOne);

// Remove element from the beginning of the array
array_shift($peopleOne);

// Split the string into an array
$string = 'Banana,Apple,Peach';
echo $string; // Banana,Apple,Peach
echo '<br>';
$fruits = explode(',', $string);
print_r($fruits); // Array ( [0] => Banana [1] => Apple [2] => Peach )

?>
```

## Booleans

PHP booleans can be `true` or `false`. They are case insensitive. `TRUE`, `True` and `true` are all valid. `1` is also considered as `true` and `0` as `false`. `null` is considered as `false`.

```php
<?php
// Create an array
$bool1 = true;
echo 'bool1 : ' . $bool1 . '<br>'; // bool1 : 1

$bool2 = True;
echo 'bool2 : ' . $bool2 . '<br>'; // bool2 : 1

$bool3 = FALSE;
echo 'bool3 : ' . $bool3 . '<br>'; // bool3 : 

$bool4 = false;
echo 'bool4 : ' . $bool4 . '<br>'; // bool4 :
?>
```





## Sources

- [PHP - manual](https://www.php.net/manual/en/){:target="_blank"}
- [Traversy Media - PHP For Absolute Beginners](https://www.youtube.com/watch?v=2eebptXfEvw){:target="_blank"}
