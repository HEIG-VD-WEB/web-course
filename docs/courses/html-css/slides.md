---
template: reveal.html
search:
  exclude: true
---

# HTML & CSS

Bertil Chapuis

<!--  -->
## Overview of Today's Class

- Quiz
- HTML 
	- Introduction
	- Elements
	- Entities
- CSS
	- Introduction
	- Selectors
	- Properties
	- Layout
	- Box Model
	- Flexbox
	- Media Queries
- Document Object Model (DOM)

<!--  -->
### Question 1

What layer of the Internet Protocol Suite does the TCP protocol belong to?
<ol style="list-style-type: upper-alpha;">
		<li>Application</li>
		<li>Transport</li>
		<li>Internet</li>
		<li>Link</li>
		<li>Session</li>
		<li>Aucune affirmation correcte</li>
</ol>

<!--  -->
### Question 2
What protocol is used by DNS to transfer Zone files?

<ol style="list-style-type: upper-alpha;">
		<li>HTTP</li>
		<li>TCP</li>
		<li>IP</li>
		<li>UDP</li>
		<li>FTP</li>
		<li>Aucune affirmation correcte</li>
</ol>

<!--  -->
### Question 3
Qu'est qu'un Root Server dans le Domain Name System (DNS)?

<ol style="list-style-type: upper-alpha;">
		<li>Un serveur qui gère les sous-domaine d'un nom de domaine racine (mail.domaine.com, web.domaine.com, etc.)</li>
		<li>Un serveur qui gère la racine des noms appartenant à un domaine (domaine1.com, domaine2.com, etc.)</li>
		<li>Un serveur qui gère la racine des noms de domaine (com, org, net, etc.)</li>
		<li>Aucune affirmation correcte</li>
</ol>

<!--  -->
### <i class="fas fa-question-circle"></i></i> Question 4
A quelle partie de l'url correspond le fragment?

```
https://tim:1234@example.com:443/index.html?param=value#home`
```

<ol style="list-style-type: upper-alpha;">
	<li><code>?param=value</code></li>
	<li><code>/index.html</code></li>
	<li><code>tim:1234</code></li>
	<li><code>https://</code></li>
	<li><code>#home</code></li>
	<li><code>example.com</code></li>
	<li><code>Aucune proposition correcte</code></li>
</ol>

<!--  -->
##  What is HTML?

- HTML stands for **Hypertext Markup Language**
- HTML is the standard markup language for creating Web pages
- HTML defines the **structure** of Web content 
- HTML is not a programming language, it is a **markup language** that uses **tags** to define elements within a document
- Hypertext is what makes the **World Wide Web** (WWW) possible 
- Hypertext refers to **cross-references** (links, images, files, etc.) that connect web pages to one another, either within a single website or between websites
- HTML5 is called a [living standard](https://html.spec.whatwg.org/) as it is constantly evolving.

https://developer.mozilla.org/en-US/docs/Web/HTML

<!--  -->
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

<!--  -->
### Why using meta tags?

Meta tags are a great way for webmasters to provide search engines and browsers with Additional information about their sites.

```html
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<meta name="Description" content="Great description" />
```

https://support.google.com/webmasters/answer/79812

<!--  -->
### Setting the viewport

```html
<meta name="viewport" content="width=device-width, initial-scale=1.0">
```

- **`width=device-width`** : the width of the page matches the screen width
- **`initial-scale=1.0`** : the initial zoom level

<!--  -->
### The Open Graph protocol

The Open Graph protocol defines common properties for the meta element.
With these properties web pages become rich objects on the Web graph. 

```html
<meta property="og:title" content="The Rock" />
<meta property="og:type" content="video.movie" />
<meta property="og:url" content="https://www.imdb.com/title/tt0117500/" />
<meta property="og:image" content="https://ia.media-imdb.com/images/rock.jpg" />
```

<img src="images/ogp.png" style="width: 200px;" />

https://www.ogp.me/
