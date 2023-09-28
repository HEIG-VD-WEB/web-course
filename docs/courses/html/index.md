# HTML

##  What is HTML?

- HTML stands for **Hypertext Markup Language**
- HTML is the standard markup language for creating Web pages
- HTML defines the **structure** of Web content 
- HTML is not a programming language, it is a **markup language** that uses **tags** to define elements within a document
- Hypertext is what makes the **World Wide Web** (WWW) possible 
- Hypertext refers to **cross-references** (links, images, files, etc.) that connect web pages to one another, either within a single website or between websites
- HTML5 is called a [living standard](https://html.spec.whatwg.org/) as it is constantly evolving.

[https://developer.mozilla.org/en-US/docs/Web/HTML](https://developer.mozilla.org/en-US/docs/Web/HTML)

### Anatomy of an HTML document

```html
<!DOCTYPE html>
<html>
<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<title>Welcome page</title>
</head>
<body>
		<h1>Hello students from the best course ever!</h1>
</body>
</html>
```

- `DOCTYPE` declaration is an instruction to the web browser about what version of HTML the page is written in.
- `<html>` is the root element of an HTML page.
- `<head>` contains the page metadata.
- `<meta charset="utf-8">` sets the character encoding for the page.
- `<title>` sets the title of the page.
- `<body>` contains the visible page content.

### Why using meta tags?

Meta tags are a great way for webmasters to provide search engines and browsers with Additional information about their sites.

```html
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<meta name="Description" content="Great description" />
```

[https://support.google.com/webmasters/answer/79812](https://support.google.com/webmasters/answer/79812)

### Setting the viewport

```html
<meta name="viewport" content="width=device-width, initial-scale=1.0">
```

- **`width=device-width`** : the width of the page matches the screen width
- **`initial-scale=1.0`** : the initial zoom level

### The Open Graph protocol

The Open Graph protocol defines common properties for the meta element.
With these properties web pages become rich objects on the Web graph. 

```html
<meta property="og:title" content="The Rock" />
<meta property="og:type" content="video.movie" />
<meta property="og:url" content="https://www.imdb.com/title/tt0117500/" />
<meta property="og:image" content="https://ia.media-imdb.com/images/rock.jpg" />
```

<img src="assets/ogp.png" style="width: 200px;" />

[https://www.ogp.me/](https://www.ogp.me/)

### Search Engine Optimization (SEO)

Search engines use opaque and complex algorithms to rank web pages based on their contents.

Search Engine Optimization (SEO) is the art of pleasing these algorithms:

- Use the right tags
- Structure tags properly
- Provide relevant metadata
- and more...

Because these algorithms evolves constantly, so does SEO.

Notes:

Checkout [this cheat sheet](https://media.licdn.com/dms/image/D4E22AQHFvZB9cmxE0w/feedshare-shrink_2048_1536/0/1690273401018?e=1697673600&v=beta&t=_arwaE_ZkkK9vd7hI_Ny18jneiZyvCPeaIW38sy4Z3Y) on SEO, made by Jordan Chenevier-Truchet (@jordanchenevier), if you want to know more.

## HTML Elements

### Anatomy of an HTML element

<img src="assets/html_basic.png" style="width: 55%">

Notes:

An HTML element:
- starts with an **opening tag**
- may have some **content**
- stops with a **closing tag**

### Attributes of an element

<img src="assets/html_attribute.png" style="width: 80%">

**Attributes** are a key-value pair, specified in the **opening tag**.

They give more information about the element, for example

- the `id` attribute gives an identifier to the element that is unique in the document,
- the `class` attribute assigns a class to the element, usually used to style it,
- the `style` attribute provides CSS properties to style the element.

Notes:

The format of an attribute is always `name="value"`.

### Text elements

Headings:

```html
<h1>Heading 1</h1>
<h2>Heading 2</h2>
<h3>Heading 3</h3>
```

Paragraph:

```html
<p>Paragraph</p>
```

Line break:

```html
<br />
```

Horizontal line:

```html
<hr />
```

Formatting:

```html
<i>italic</i> <b>bold</b> <u>underline</u>
```

### Hyperlink element

```html
<a href="https://www.heig-vd.ch" title="Heig-vd" target="_blank">Heig-vd</a>
```

```html
<a href="mailto:username@email.com?subject=hello&body=world!">Hello World!</a>
```

Specifies a hyperlink to another location.

- `href` : URL of the linked webpage
- `title` : text to display as a tooltip when hovering over the link
- `target` : where to open the linked document (e.g., `_blank` opens the document in a new tab)

### Media elements

The image element must have an `src` (image url) and `alt` (caption of the image) attribute.

```html
<img src="image.jpg" alt="caption" />
```

The audio element requires special permissions to autoplay.

```html
<audio src="audio.mp3"></audio>
```

The canvas element allows for dynamic, scriptable rendering of 2D and 3D shapes.

```html
<canvas></canvas>
```

Notes:

It is very bad practice to ommit the `alt` attribute of an image. In addition to being displayed when hovering over the image, it is used by screen readers to describe the image to visually impaired users. Accessibility is a crucial aspect of web development.


### Nested lists

Numbered lists and enumerations can be nested.

```html
<ol>
  <li>A</li>
  <li>B 
    <ul>
      <li>C</li>
      <li>D</li>
      <li>E</li>
    </ul>
  </li>
  <li>F</li>
</ol>
```

- `ol` is the root tag for **o**rdered **l**ists
- `ul` is the root tag for **u**nordered **l**ists
- `li` is a **l**ist **i**tem


### Tables

Tables should only be used for tabular data, not for layout.

```html
<table>
    <!-- row -->
    <tr>
        <!-- header column -->
        <th>Student ID</th>
        <th>Grade</th>
    </tr>
    <tr>
        <!-- regular column -->
        <td>4</td>
        <td>5</td>
    </tr>
    <tr>
        <!-- merged columns -->
        <td colspan="2">6</td>
    </tr>
</table>
```

- `tr` is a **t**able **r**ow
- `td` is a **t**able **d**ata, i.e. a regular cell
- `th` is a **t**able **h**eader, i.e. a header cell

The `colspan` and `rowspan` attributes are used to merge cells.

### HTML Forms    

HTML Forms are one of the main points of interaction between a user and a web site or application. Forms allow users to enter data, generally sending that data to the web server.

The `<form>` element defines a form.

```html
<form action='/articles/' method='POST'>
    <label for="email">E-mail:</label>
    <input type="email" id="email" name="email" />
    <label>Title:
        <input type="text" id="title" name="title" />
    </label>
    <label for="content">Content:</label>
    <textarea id="content" name="content" />
    <button type="submit">Save</button>
</form>
```

- The `action` attribute defines the location (URL) where the form should be sent when it is submitted.
- The `method` attribute defines which HTTP method to send the data with (it can be "get" or "post").

[https://developer.mozilla.org/en-US/docs/Learn/HTML/Forms/Your_first_HTML_form](https://developer.mozilla.org/en-US/docs/Learn/HTML/Forms/Your_first_HTML_form)

### HTML Input Element

There exist many types of input elements, each with its own behavior and set of attributes.

Some of the available types are: `text`, `password`, `submit`, `hidden`, `radio`, `checkbox`, `file`, `email`, `url`, `date`, `url`, etc.

Common attributes are

- `name`: the name of the input, which is submitted with the form data.
- `value`: the default value of the input.
- `placeholder`: the text that appears within the input when empty.
- `required`: indicates that the input is mandatory. Submission will be blocked if the input is empty.
- `readonly`: indicates that the input cannot be edited.

[https://developer.mozilla.org/en-US/docs/Web/HTML/Element/input](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/input)

### Semantic elements

Header:

```html
<header></header>
```

Navigation:

```html
<nav></nav>
```

Main (dominant content of the body):

```html
<main></main>
```

Footer:

```html
<footer></footer>
```

Division (content block):

```html
<div></div>
```

Article (self-contained composition in a document):

```html
<article></article>
```

Section (generic content block):

```html
<section></section>
```

Aside (content related to the main content):

```html
<aside></aside>
```

Notes:

Using semantic elements is important for accessibility and SEO, because it helps screen readers and search engines to understand the structure of the page.

### A growing list of elements
[https://developer.mozilla.org/en-US/docs/Web/HTML/Element](https://developer.mozilla.org/en-US/docs/Web/HTML/Element)

## HTML Entities

A character sequence that begins with an ampersand (&) and ends with a semicolon (;), used to describe special or reserved characters.

<table>
    <tr>
        <th>Character</th>
        <th>Entity</th>
        <th>Note</th>
    </tr>
    <tr>
        <td>&</td>
        <td><code>&&#8203amp;</code></td>
        <td>Interpreted as the beginning of an entity or character reference.</td>
    </tr>
    <tr>
        <td><</td>
        <td><code>&&#8203lt;</code></td>
        <td>Interpreted as the beginning of a tag.</td>
    </tr>
    <tr>
        <td>></td>
        <td><code>&&#8203gt;</code></td>
        <td>Interpreted as the end of a tag.</td>
    </tr>
    <tr>
        <td>"</td>
        <td><code>&&#8203quot;</code></td>
        <td>Interpreted as the beginning or end of an attribute value.</td>
    </tr>
</table>

https://developer.mozilla.org/en-US/docs/Glossary/Entity
