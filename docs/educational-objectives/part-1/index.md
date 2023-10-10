# Part 1 - HTML, CSS, JavaScript

## HTML

- What does HTML stand for, and what is its primary purpose in web development?

??? success
	HTML stands for HyperText Markup Language, and its primary purpose in web development is to structure and present content on web pages.

- Differentiate between HTML elements and HTML attributes. Provide examples of each.

??? success
	HTML elements are the building blocks of a web page, such as `<p>`, `<h1>`, and `<a>`. HTML attributes provide additional information about elements, such as href in `<a>` or src in `<img>`.

- Explain the role of the <head> and <body> sections in an HTML document. Give examples of what type of content should go in each.

??? success
	The `<head>` section contains metadata about the document, such as the page title, links to stylesheets, and scripts. The `<body>` section contains the content that will be displayed on the page, such as headings, paragraphs, images, and links.

- Describe semantic HTML and provide examples of semantic elements.

??? success
	Semantic HTML is the use of HTML markup to reinforce the meaning of the information in webpages rather than merely define its presentation or look. Examples of semantic elements include `<header>`, `<nav>`, `<main>`, `<article>`, `<section>`, `<aside>`, `<footer>`, `<figure>`, and `<figcaption>`.

- What is the purpose of HTML5's <canvas> element, and how is it typically used?

??? success
	The `<canvas>` element is used to draw graphics, animations, or other visual images on a webpage using JavaScript.

- Discuss the importance of using semantic HTML tags and their impact on accessibility and SEO.

??? success
	Semantic HTML tags help search engines understand the content of a webpage and improve the page's ranking in search results. Semantic HTML tags also help screen readers and other assistive technologies understand the content of a webpage and improve accessibility for users with disabilities.

- Provide examples of common HTML and CSS coding conventions and naming conventions that adhere to best practices.

??? success
	Common conventions include using lowercase letters for HTML tags and attribute names, using hyphens for multi-word class names (e.g., class="my-class"), and following naming conventions like BEM (Block Element Modifier) for CSS classes.

## CSS

- Explain the box model in CSS. How does it affect the layout and styling of elements on a webpage?

??? success
	The box model is a way of representing the space taken up by an element on a webpage. It consists of the content area, padding, border, and margin. The box model affects the layout and styling of elements on a webpage by determining the size of the element and its position relative to other elements.

- Describe the difference between inline, internal, and external CSS styles. When might you use each approach?

??? success
	Inline CSS styles are applied directly to an element using the style attribute. Internal CSS styles are defined in the `<head>` section of an HTML document using the `<style>` tag. External CSS styles are defined in a separate CSS file and linked to an HTML document using the `<link>` tag. Inline styles are typically used to apply styles to a single element, internal styles are typically used to apply styles to a single page, and external styles are typically used to apply styles to multiple pages.

- What is the purpose of CSS selectors? Provide examples of different types of selectors.

??? success
	CSS selectors are used to select the HTML elements to which styles should be applied. Examples of selectors include element selectors (e.g., `p`), class selectors (e.g., `.my-class`), ID selectors (e.g., `#my-id`), and attribute selectors (e.g., `[type="text"]`).

- How can you apply CSS styles specifically to different media types (e.g., screen, print)?

??? success
	You can use the `@media` rule to apply CSS styles specifically to different media types. For example, you can use the `@media screen` rule to apply styles to screens and the `@media print` rule to apply styles to printed documents.

- Explain the concept of CSS specificity and how it influences the application of styles.

??? success
	CSS specificity is a set of rules that determine which CSS styles are applied to an element when multiple styles are defined for the same element. The rules are as follows: 1) inline styles override internal styles, which override external styles; 2) more specific selectors override less specific selectors; and 3) selectors of equal specificity override each other based on the order in which they are defined.

- Explain the difference between a class and an ID in CSS. When should you use one over the other?

??? success
	Classes in CSS are used for applying styles to multiple elements with similar characteristics, while IDs are meant for unique elements. Classes are preferred for styling because they are more reusable.

- Define what a "CSS reset" is and why it's used in web development.

??? success
	A CSS reset is a set of CSS styles that resets the default styles of HTML elements to a consistent baseline across browsers. It is used to avoid cross-browser compatibility issues.

	Example:
	```css
	* {
		margin: 0;
		padding: 0;
		box-sizing: border-box;
	}
	```

## JavaScript

- Briefly describe the role of JavaScript in web development.

??? success
	JavaScript is a scripting language used for adding interactivity and dynamic behavior to web pages. It is used to create interactive elements like buttons, forms, and animations.

- Differentiate between variables declared with `var`, `let`, and `const`. When should you use each?

??? success
	Variables declared with `var` are function-scoped, variables declared with `let` are block-scoped, and variables declared with `const` are block-scoped and cannot be reassigned. You should use `var` when you want to declare a variable that is accessible throughout a function, `let` when you want to declare a variable that is accessible only within a block, and `const` when you want to declare a variable that is accessible only within a block and cannot be reassigned.

	Example:
	```js
	// var
	function myFunction() {
		var x = 5;
		if (true) {
			var x = 10;
			console.log(x); // 10
		}
		console.log(x); // 10
	}

	// let
	function myFunction() {
		let x = 5;
		if (true) {
			let x = 10;
			console.log(x); // 10
		}
		console.log(x); // 5
	}

	// const
	function myFunction() {
		const x = 5;
		if (true) {
			const x = 10;
			console.log(x); // 10
		}
		console.log(x); // 5
	}
	```

- What is the DOM (Document Object Model), and how does JavaScript interact with it?

??? success
	The DOM is a programming interface for HTML and XML documents. It represents the document as a tree of nodes and objects that can be manipulated with JavaScript.

- What is the differance between `==` and `===`?

??? success
	The `==` operator compares two values for equality after converting both values to a common type. The `===` operator compares two values for equality without converting the values to a common type.

	Example:
	```js
	1 == '1'; // true
	1 === '1'; // false
	```

<!-- - Explain the difference between synchronous and asynchronous JavaScript. Provide examples of each.

??? success
	Synchronous JavaScript is executed in the order in which it appears in the code. Asynchronous JavaScript is executed after other code has finished executing. Examples of synchronous JavaScript include `for` loops and `if` statements. Examples of asynchronous JavaScript include `setTimeout` and `fetch`. -->

- What is an event listener, and how can you use it to respond to user interactions on a webpage?

??? success
	An event listener is a function that is called when a specific event occurs, such as a mouse click or key press. You can use event listeners to respond to user interactions on a webpage by attaching them to HTML elements.

- Why does database calls in media player application are asynchronous? 

??? success
	You should never block the [Event Loop](https://nodejs.org/en/docs/guides/dont-block-the-event-loop)


- [JS is weird](https://jsisweird.com/){:target="_blank"}

