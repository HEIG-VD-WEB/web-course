
# Document Object Model (DOM)

## What is the DOM?

The **Document Object Model** is

- a programming interface for HTML and XML to let programs manipulate the document

- an object-oriented representation of the structure of a document in memory

[https://developer.mozilla.org/en-US/docs/Web/API/Document_Object_Model](https://developer.mozilla.org/en-US/docs/Web/API/Document_Object_Model){:target="_blank"}

## The DOM's content tree

```html
<html>
<head>
  <title>My Document</title>
</head>
<body>
  <h1>Header</h1>
  <p>Paragraph</p>
</body>
</html>
```

When parsing an HTML document, browsers build a **content tree**, then used to **display** the document.

<img src="assets/html_content_tree.jpg" style="width: 32%"/>

<span class="detail">
    
[https://developer.mozilla.org/en-US/docs/Web/API/Document_object_model/Using_the_W3C_DOM_Level_1_Core](https://developer.mozilla.org/en-US/docs/Web/API/Document_object_model/Using_the_W3C_DOM_Level_1_Core){:target="_blank"}

</span>

## How does DOM rendering work?

When a browser displays a document, it must combine the document's content with its style information.

<img src="assets/html_dom.svg" />

[https://developer.mozilla.org/en-US/docs/Learn/CSS/First_steps/How_CSS_works](https://developer.mozilla.org/en-US/docs/Learn/CSS/First_steps/How_CSS_works){:target="_blank"}
