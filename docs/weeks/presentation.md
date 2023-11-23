---
marp: true
---

<!--
theme: gaia
size: 16:9
paginate: true
author: V. Guidoux, with the help of ChatGPT, L. Delafontaine and H. Louis.
title: HEIG-VD WEB Course - PHP
description: PHP course for the WEB course at HEIG-VD, Switzerland
url: https://github.com/HEIG-VD-WEB/web-course/tree/main/docs/courses
footer: '**HEIG-VD** - WEB Course 2023-2024 - AGPL-3.0 license'
style: |
    :root {
        --color-background: #fff;
        --color-foreground: #333;
        --color-highlight: #f96;
        --color-dimmed: #888;
        --color-headings: #7d8ca3;
    }
    blockquote {
        font-style: italic;
    }
    table {
        width: 100%;
    }
    th:first-child {
        width: 15%;
    }
    h1, h2, h3, h4, h5, h6 {
        color: var(--color-headings);
    }
    h2, h3, h4, h5, h6 {
        font-size: 1.5rem;
    }
    h1 a:link, h2 a:link, h3 a:link, h4 a:link, h5 a:link, h6 a:link {
        text-decoration: none;
    }
    section:not([class=lead]) > p, blockquote {
        text-align: justify;
    }
headingDivider: 4
-->

<!-- This is a way to make link and shortcut in the code -->
[illustration]:
  https://images.unsplash.com/photo-1588942411963-f40f321ea7d5?q=80&w=1170&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D

[problem]:
  https://images.unsplash.com/photo-1621252179027-94459d278660?q=80&w=1170&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D

[working]:
  https://plus.unsplash.com/premium_photo-1669592886888-9a1b1827be77?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8ZW50cmVwcmVuZXVyfGVufDB8fDB8fHww

[burnout]:
  https://images.unsplash.com/photo-1456406644174-8ddd4cd52a06?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTB8fGJ1cm4lMjBvdXQlMjBzdHVkZW50fGVufDB8fDB8fHww

[quiz]:
  https://images.unsplash.com/photo-1606326608690-4e0281b1e588?q=80&w=1170&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D

## Week 9

<!--
_class: lead
_paginate: false
-->
<!-- This comment will center everything on the page -->

![bg opacity:0.1][illustration]

## Still alive ?

![bg right:40%][burnout]

## Errors have been made

- Asking too many things
- Test and practical work simplified

![bg right][problem]

## Fail fast, fail cheap

Or Learn fast, learn cheap

Who knows what it is ?

![bg right][working]

# Quiz

<!--
_class: lead
color: black
-->

#### Situation

An improvisation troupe asked me to create a showcase website with information about the troupe and a way of contacting them. Should I use PHP to implement it ?

- A) YES
- B) NO

# B) NO

<!--
_class: lead
-->

#### HTML form

What is the correct URL resulting from a GET request sent from an HTML form with the following attributes ?

```html
<form action="https://web.com/" method="GET">
		<input type="text" name="name" value="John">
		<input type="text" name="age" value="42">
		<input type="submit" value="Submit">
</form>
```

- A) `https://web.com/?name=John&age=42`
- B) `https://web.com/?name=John&age=42&submit=Submit`

# A) `https://web.com/?name=John&age=42`

<!--
_class: lead
-->

## Question

Which of the following is a URL resulting from a GET request ?

- A) `https://web.com/`
- C) `localhost:8000/?name=John&age=42`

# BOTH `https://web.com/` and `localhost:8000/?name=John&age=42`

## Question

<small>
Which of the following the right definition of PHP ?

- A) PHP is a programming language that can be used to create **dynamic** web pages, needs **compilation** and is executed on the **server** side.
- B) PHP is a programming language that can be used to create **dynamic** web pages, needs **compilation** and is executed on the **client** side.
- C) PHP is a programming language that can be used to create **dynamic** web pages, is an **interpreted** language and is executed on the **server** side.
- D) PHP is a programming language that can be used to create static web pages, is an **interpreted** language and is executed on the **client** side.
</small>

# C) PHP is a programming language that can be used to create dynamic web pages, is an interpreted language and is executed on the server side.

<!--
_class: lead
-->

## Question

What does this code do ?

```php
<?php
    $a = "5 apples";
    $b = 3;

    $result = $a + $b;

    echo $result;
?>
```

---

- A) Outputs "8"
- B) Outputs "5 apples3"
- C) Generates a warning or error
- D) Outputs "53"


# C) Generates a warning or error

<!--
_class: lead
-->

## Question

What does this code do ?

```php
<?php
    $x = "10";
    $y = "20";

    $result = $x + $y;

    echo $result;
?>
```

---

- A) Outputs "30"
- B) Outputs "1020"
- C) Generates a warning or error
- D) Outputs "10"

# A) Outputs "30"

<!--
_class: lead
-->

## Which of the following are good practices for maintaining code integrity?

- A) Use a version control system, pull requests and code reviews.
- B) Listening to the client and doing what they want.
- C) Having more time talking about the code than writing it.
- D) Use Linter, Formatter and tests.

# A and D

<!--
_class: lead
-->

## Question

<small>
While using a package manager like Composer, what is the purpose of the `composer.lock` file ?

- A) The composer.lock file stores the Composer configuration settings for a project.
- B) It is a backup file that contains the previous versions of the installed packages.
- C) composer.lock is used to lock the entire project, preventing any changes to the codebase or dependencies.
- D) The composer.lock file stores the exact version of every package that is installed in the project.
</small>

# D) The composer.lock file stores the exact version of every package that is installed in the project.

<!--
_class: lead
-->

## Question

What should you commit ?

- A) The `vendor` folder, and the `composer.json` file.
- B) The `composer.json` and `composer.lock` files.
- C) The `vendor` folder, and the `composer.lock` file.
- D) The `vendor` folder, and the `composer.json` and `composer.lock` files.

# B) The `composer.json` and `composer.lock` files.

## And now ?

- Practical work
- Keeping up with the other course so you do not have a mental breakdown
- I'm here if you want to go deeper in PHP

