# Practical work 2

## Objectives

Prove that you can create a dynamic website using PHP with a database. You will have to create a website that allows you to manage a dataset. The dataset can be anything you want (e.g., a list of books, a list of movies, a list of students, etc.).

## Group composition

You will work in groups of one student

## Grading criteria

- 0 point - The work is not done
- 1 point - The work is insufficient
- 2 points - The work is done

Maximum grade: ((46 points \\ 46) * 5) + 1 = 6

### Category 1 - View

| #   | Criterion                                                                                  | Points |
| --: | -----------------------------------------------------------------------------------------  | -----: |
| 1   | HTML forms are used for creating entries in the dataset                                    |      2 |
| 2   | HTML forms are used for updating entries in the dataset                                    |      2 |
| 3   | HTML forms are used for deleting entries in the dataset                                    |      2 |
| 4   | HTML forms include validation for user input (e.g., required fields, input format checks). |      2 |
| 5   | HTML views permits to read entries in the dataset                                          |      2 |

### Category 2 - Controller

|  # | Criterion                                                                                                           | Points |
|---:|---------------------------------------------------------------------------------------------------------------------|-------:|
|  6 | The project is implemented using the MVC pattern, there is a clear separation between models, views and controllers |      2 |
|  7 | The controller is implemented using PHP                                                                             |      2 |
|  8 | Routes are used to create entries in the dataset                                                                    |      2 |
|  9 | Routes are used to update entries in the dataset                                                                    |      2 |
| 10 | Routes are used to delete entries in the dataset                                                                    |      2 |
| 11 | Routes are used to read entries in the dataset                                                                      |      2 |
| 12 | A library manager is used to manage the dependencies of the project (e.g., Composer, Pickle)                        |      2 |
| 13 | The controllers check the inputs from the user                                                                      |      2 |

### Category 3 - Model

|  # | Criterion                                                                  | Points |
|---:|----------------------------------------------------------------------------|-------:|
| 14 | Design the database schema for your application. (e.g., MYSQL, PostgreSQL) |      2 |
| 15 | An ORM is used to interact with the database (e.g., Eloquent, Doctrine)    |      2 |
| 16 | The database is containerized                                              |      2 |

### Category 4 - Interactivity

The application should provide a user-friendly interface with interactive elements.

|  # | Criterion                                           | Points |
|---:|-----------------------------------------------------|-------:|
| 17 | There are feedback on successful or failed actions. |      2 |

### Category 5 - Repository

The repository should be well organized and documented. It should be easy to install and run the project locally.

|  # | Criterion                                                                           | Points |
|---:|-------------------------------------------------------------------------------------|-------:|
| 18 | The project is on GitHub                                                            |      2 |
| 19 | The project has a README.md file and it has a description of the project            |      2 |
| 20 | The README.md file contains the instructions to run the project locally             |      2 |
| 21 | The project has a .devcontainer folder and a functionnal devcontainer               |      2 |
| 22 | A linter (e.g., PHP CodeSniffer, PHP-CS-Fixer) is used to enforce coding standards. |      2 |
| 23 | The code is well documented                                                         |      2 |

## Remarks

No more bonus points if it's funny or educational? In the spirit of inclusiveness, not everyone has the extra time for these kinds of points. But make it your own! That doesn't mean it can't be fun or educational. It's always a pleasure to see what direction you're going in when you've got the freedom to do so.

You can use any framework you want, Laravel, Symfony, etc. But you can also do it without a framework.

For the frontend, do not use Hugo, Jekyll, or any other static site generator. If we saw it on the course, it was to end the theory about the static web technologies.

Always complete never finished!

You can use anything you want to create your website as long as you specify the source.

You can **not** use JQuery.

You do not need to deploy your website.

## Submission

The deadline is the Wednesday 22 November 2023 at 22h00.

Any commit after the deadline will not be taken into account. Each day of delay will result in a penalty of -1 point on the final grade.

To submit your work, create a new GitHub Discussion at <https://github.com/orgs/HEIG-VD-WEB/discussions> with the following information:

- **Title**: WEB 2023-2024 - Practical work 2 - First name
- **Category**: Show and tell
- **Description**: The URL of your repository

If your repository is private, you must add me as collaborator to your repository!

If you don't want your first name to appear on GitHub, you can use your GitHub username instead. Juste email me to let me know.

## Grades and feedback

Grades will be entered into GAPS, followed by an email with the feedback.

The evaluation will use exactly the same grading grid as shown in the course material.

Each criterion will be accompanied by a comment explaining the points obtained, a general comment on your work and the final grade.

If you have any questions about the evaluation, you can contact me!

## Ideas

- Task Management System:
	- Create a web application that allows users to manage their tasks. Users can create, edit, delete, and mark tasks as completed.
- E-commerce Website:
	- Build a basic e-commerce website where users can browse products, add items to a shopping cart, and complete orders.
- Blog Platform:
	- Develop a blog platform where users can create, edit, and publish blog posts.
- Online Quiz System:
	- Create an online quiz system where users can take quizzes on various topics.
- Student Management System:
	- Design a student management system for schools or universities. **Can you beat GAPS ?**
- Recipe Sharing Platform
- Inventory Management System:
	- Create an inventory management system for businesses to track products, manage stock levels, and generate reports.
- Event Registration Portal:
	- Build a system for event registration. Users can sign up for events, view event details, and receive event-related notifications.
- Weather App:
	- Develop a weather application that fetches weather data from an API and displays it to users. Users can search for weather in different locations.
