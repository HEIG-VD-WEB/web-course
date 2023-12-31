# CSS

## What is CSS?

**Cascading Style Sheets** is a core language of the Web used to style web pages.

- **Cascading** means it is read from top to bottom, only once.

- It is a **stylesheet language** for HTML or XML documents <br>(including XML dialects such as SVG, MathML or XHTML)

- It describes how **elements** should be **rendered** on a media <br>
  (a media can be a screen, a paper, etc.)

- CSS is **standardized** across Web browsers according to the [W3C specification](https://www.w3.org/Style/CSS/#specs),<br>the latest version being CSS3.

[https://developer.mozilla.org/en-US/docs/Web/CSS](https://developer.mozilla.org/en-US/docs/Web/CSS){:target="_blank"}


## Anatomy of a CSS document

### Rulesets

A CSS document is a sequence of **rulesets**, used for styling specified parts of the document.

<img src="assets/css_rulesets.png" />

A ruleset is composed of

- a comma-separated list of **selectors**, and
- a **declarations block** describing the styling of the selected elements.

### Declarations

A declaration block is a sequence of **declarations**,
each consisting of a **property** and the **value**
associated to that property, separated by a colon
(`:`).

<img src="assets/css_declarations_block.png" />

The **cascading** behavior of CSS means that a
declaration overrides any conflicting declarations made
earlier.

There are more than [100 different
properties](https://developer.mozilla.org/en-US/docs/Web/CSS/Reference)
in CSS.

[https://developer.mozilla.org/en-US/docs/Web/CSS/Syntax](https://developer.mozilla.org/en-US/docs/Web/CSS/Syntax){:target="_blank"}

Notes:

- **Selectors** are conditions selecting some elements of the page, those that will be affected by the ruleset.
- **Declarations** are grouped in **blocks**, and separated by semi-colons (`;`). They can sometimes be nested in the case of media queries (will be covered later in this presentation).
- **Properties** and **values** form **declarations** and are separated by a colon (`:`). They are case-insensitive. There are more than [100 different properties](https://developer.mozilla.org/en-US/docs/Web/CSS/Reference) in CSS.

### Rulesets

<img src="assets/css_rulesets.png" />

- **Rulesets** apply declarations to **specific** parts of the document

- **Declaration blocks** are preceded by one or more comma-separated **selectors**

- **Selectors** are conditions selecting some elements of the page

- **Cascading** refers to the precedence of the **selectors** over each others

### Declarations block

<img src="assets/css_declarations_block.png" />

- CSS declarations are grouped in **blocks**

- CSS declarations are **separated** by a **semi-colon** (`;`) 

- Blocks are **delimited** by an opening (`{`) and a closing **brace** (`}`)

- Sometimes blocks can be **nested** (e.g., media queries)

[https://developer.mozilla.org/en-US/docs/Web/CSS/Syntax](https://developer.mozilla.org/en-US/docs/Web/CSS/Syntax){:target="_blank"}

### Declaration

<img src="assets/css_declaration.png" />

- Setting **CSS properties** is the core function of the CSS language

- A **property** and **value** pair is called a **declaration**

- **Properties** and **values** are case-insensitive

- The pair is separated by a colon `:`

- There are more than [100 different properties](https://developer.mozilla.org/en-US/docs/Web/CSS/Reference) in CSS 

[https://developer.mozilla.org/en-US/docs/Web/CSS/Syntax](https://developer.mozilla.org/en-US/docs/Web/CSS/Syntax){:target="_blank"}

### Adding CSS to an HTML Document

**Embedded stylesheets** are contained in a `<style>` element inside the HTML document:

```html
<html>
  <head>
    <style>
      body {
        background-color: linen;
      }
    </style>
  </head>
  <body></body>
</html>
```

**External stylesheets** are contained in a file that is then imported with a `link` element:

```html
<html>
  <head>
    <link rel="stylesheet" type="text/css" href="style.css">
  </head>
  <body></body>
</html>
```

**Inlined directives** are added in the `style` attribute of an element.

```html
<h1 style="color: blue; font-size: 32px;">I'm blue</h1>
```
## Selectors

### Selectors

The **type selector** selects the elements that match the given node name:

```css
p {}
```

The **id selector** selects the elements that have a given id attribute:

```css
#myid {}
```

The **class selector** selects the elements that have a given class attribute:

```css
.myclass {}
```

The **universal selector** select all the elements:

```css
* {}
```

The **attribute selector** select the elements with a given attribute:

```css
[attr=value] {}
```

Selectors can be **grouped**:

```css
h1, h2, h3, p {}
```

[https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_Selectors](https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_Selectors){:target="_blank"}

### Selectors++

The `id`, `class` and `attribute` selectors can be
combined by adding them as suffixes to other selectors.

```css
p#myid                     /* a p element with id "myid" */
*.myclass                  /* any element with class "myclass" */
p.myclass#myid[attr=value] /* a p with class "myclass", id "myid" and "attr=value" */
````

### Combinators

**CSS Combinators** can be used to mix several selectors.

The ` ` (space) combinator selects nodes that are descendants of the first element.
 
```css
ul li {}
```

The `>` combinator selects nodes that are direct children of the first element.

```css
ul > li {}
```

Other combinators, such as `+`, `~`, respectively applies to **adjacent** and **sibling** elements in the DOM.

[https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_Selectors](https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_Selectors){:target="_blank"}

Notes:

- `a b` selects all elements that match `b` and are (potentially non-direct) descendants of elements that match `a`.
- `a > b` selects all elements that match `b` and are *direct* children of elements that match `a`.
- `a ~ b` selects all elements that match `b` and are *siblings* of elements that match `a` (i.e. both `a` and `b` have the same parent).
- `a + b` selects all elements that match `b` and are *adjacent* siblings of elements that match `a` (i.e. both `a` and `b` have the same parent, and `b` immediately follows `a`).

### Pseudo-class

A **pseudo-class** is a keyword added to a selector that specifies a special state of the selected element(s). 

The `:hover`, `:link`, `:visited` and `:active` pseudo-class matches when the user interacts with an element with a pointing device. 

```css
a:hover { background-color: red; }
```

The :nth-child() CSS pseudo-class matches elements based on their position in a group.

```css
td:nth-child(2n) { background-color: gray; }
```

[https://developer.mozilla.org/en-US/docs/Web/CSS/Pseudo-classes](https://developer.mozilla.org/en-US/docs/Web/CSS/Pseudo-classes){:target="_blank"}

Notes:

The argument to `nth-child` is an `an+b` expression, where `a` and `b` are integers.

For any element, if there exists a value of `n` such that that element is the `an+b`th child of its parent, then that element matches the `:nth-child(an+b)` pseudo-class.

Note that the first child of an element is said to be child number 1, not 0.


### More Pseudo-classes

<img src="assets/css_pseudoclass.png" style="width:60%">


### Specificity

Specificity determines which CSS directive is applied to an element.

The specificity algorithm assigns a 4-vector to each
declaration : `(a, b, c, d)`.

- `a` - 1 if declaration is **inlined**, 0 otherwise.
- `b` - Number of **ID** selectors in the ruleset.
- `c` - Number of **classe, attribute and pseudo-classe** selectors in the ruleset.
- `d` - Number of **element and pseudo-element** selectors in the ruleset.

Two declarations are compared by comparing their vectors
from left to right. The highest wins.

```css
#myElement {
		color: green;  /* (0, 1, 0, 0)  - WINS!! */
}
.bodyClass .sectionClass .parentClass [id="myElement"] {
		color: yellow; /* (0, 0, 4, 0) */
}
```

```css
#myElement {
		color: yellow; /* (0, 1, 0, 0) */
}
#myApp [id="myElement"] {
		color: green;  /* (0, 1, 1, 0)  - WINS!! */
}
```

[https://developer.mozilla.org/en-US/docs/Web/CSS/Specificity](https://developer.mozilla.org/en-US/docs/Web/CSS/Specificity){:target="_blank"}

Notes:

When we say "compared from right to left", we mean that, first, the values of `a` are compared. If one is higher than the other, that declaration wins. Otherwise if they are equal, the values of `b` are compared. If one is higher than the other, it wins, and so on. If we reach equality, the cascading rule applies, and the last declaration wins.

## Properties
### Text Properties

```css
p {
    text-align: center;
    line-height: 2em;
    letter-spacing: 2em;
    text-decoration: underline;
    text-transform: uppercase;
}
```

There are many CSS properties for text manipulation, like line breaking, justification and alignment, white space handling, and text transformation.

[https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_Text](https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_Text){:target="_blank"}

### Background Properties

```css
body {
    background-color: blue;
    background-image: url('../image.jpg');
    background-repeat: no-repeat;
    background-size: auto;
}
```

There are many more CSS properties for background manipulation, like background position, background attachment, background origin, etc.

[https://developer.mozilla.org/en-US/docs/Web/CSS/background](https://developer.mozilla.org/en-US/docs/Web/CSS/background){:target="_blank"}

Notes:

Background repeat can be used to repeat the background image horizontally, vertically, or both. It can also be used to repeat the background image only once, or not at all.

Background clip helps to define the painting area of the background. It can be used to clip the background to the border box, padding box, or content box.

Background attachment can be used to make the background image fixed with regard to the viewport or scrollable with the content.

### Color Property

The color property sets the foreground color value of an element's text.

```css
p {
    /* named-color values */
    color: red;
    color: orange;

    /* hex-color values */
    color: #090;
    color: #009900;

    /* rgb() values */
    color: rgb(34, 12, 64, 0.6);
    color: rgba(34, 12, 64, 0.6);
}
```

**Color values** can be used with other CSS properties such as:

```css
background-color: #090;
border-color: #090;
```

[https://developer.mozilla.org/en-US/docs/Web/CSS/color](https://developer.mozilla.org/en-US/docs/Web/CSS/color){:target="_blank"}

### Font Properties

```css
p {
    font-family: Times New Roman, serif, Arial, sans-serif, Consolas, monospace;
    font-style: italic;
    font-weight: bold;
    font-size: 1.5em;
}
```
The font property sets an element's font to a system font.

- The first font specified that is available is used to display the element.
- The recommended font size units are `px`, `em` and `%`. Pixels are fixed, wheareas `em` and `%` are relative to the font size specified for the document.  

### External Fonts

Additional fonts can be imported in a stylesheet with the import directive.

```css
@import url('https://fonts.googleapis.com/css?family=Roboto&display=swap');

body{
    font-family: 'Roboto', sans-serif;
}
```

[fonts.google.com](https://fonts.google.com) and [fonts.com](https://fonts.com) provide public registries for fonts.


[https://developer.mozilla.org/en-US/docs/Web/CSS/font](https://developer.mozilla.org/en-US/docs/Web/CSS/font){:target="_blank"}

### Properties and Inheritance

Some properties applied to an element are inherited by its children.

```css
body {
    font-size: 18px;
    color: black;
}
```

<img src="assets/css-inheritence-1.png" style="width:35%">

[https://developer.mozilla.org/en-US/docs/Web/CSS/Reference#concepts](https://developer.mozilla.org/en-US/docs/Web/CSS/Reference#concepts){:target="_blank"}

- **Do Inherit:** `color`, `font`, `line-height`, `letter-spacing`, `text-align`, etc.

- **Do not Inherit:** `background-color`, `border`, `padding`, `margin`, etc.

You can always use the `inherit` keyword to force inheritance.

[https://developer.mozilla.org/en-US/docs/Web/CSS/Reference#concepts](https://developer.mozilla.org/en-US/docs/Web/CSS/Reference#concepts){:target="_blank"}

## Layout

### Layout

The **display** property specifies if/how an element is displayed.

The default value of `display` depends on the element. The most common values are:

- **block**: element generates line break before and after itself. Can have specified height and width. If unspecified, takes up the whole width of its parent element (e.g. div, p, h1, h2, etc.).

- **inline**: element does not generate line breaks, only takes up as much width as necessary (e.g. span, a, img, etc.). It will be on the same line as other inline elements, if there is space.

- **inline-block**: element is displayed as an inline element, but can have specified width and height (e.g. buttons, input fields, etc.).

- **none**: element is not displayed at all.

*And many more*

## Box Model

### Box Model

The Box model (`display: block`) is a box that wraps around every HTML elements and consists of: margins, borders, padding and the actual content.

<img src="assets/box-model.png" style="width: 28%">

```css
div {
    display: block;
    margin: 20px 10px 20px 15px;
    padding: 10px;
    border: solid 1px red;
    border-radius: 20px;
    width: 200px;
    height: 100px;
}
```

<span class="detail">
    
[https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_Box_Model/Introduction_to_the_CSS_box_model](https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_Box_Model/Introduction_to_the_CSS_box_model){:target="_blank"}

</span>

### Width and Height

The width and height properties are used to set the width and height of an element.

```css
.box {
    width: 200px;
    height: 200px;
}
```

The min-width and max-width properties specify the minimum and maximum width of an element.

```css
.box {
    min-width: 100px;
    max-width: 300px;
}
```

The min-height and max-height properties specify the minimum and maximum height of an element.

```css
.box {
    min-height: 100px;
    max-height: 300px;
}
```

### Box Sizing

By default, the width and height properties are applied to the content-box. The actual width and height will thus be larger by the size of the padding, border and margin.

<img src="assets/css-box-sizing-1.png" style="width:60%">

The `box-sizing` property changes this behavior, by specifying which box model should be used.

For example, use `box-sizing: border-box` to include the padding and border in an element's total
width.

<img src="assets/css-box-sizing-2.png" style="width: 60%">


### Overflow

An element overflows when its contents do not fit inside
it.  The overflow property sets the desired behavior for
an element's overflow.

```css
.box {
    max-height: 70px;
    overflow: hidden;
}
```

The overflow property can have one of the following values:
- **visible** (the default) – Content is rendered outside
- **hidden** – The content is clipped to hide overflowing content
- **scroll** – Looks the same as hidden, but always with scrollbars
- **auto** – Browser displays scrollbars only if content overflows

### Positionning

```html
<div id="el">My element</div>
```

```css
#el {
    position: fixed
    top: 100px;
    left: 100px;
    bottom: 100px;
    right: 100px;
}
```

The position CSS property sets how an element is positioned in a document.

- `static`: The element is positioned according to the normal flow of the document.
- `relative`: The element is positioned according to the normal flow of the document, and then offset relative to itself.
- `absolute`: The element is positioned relative to its closest non-static positioned ancestor.
- `fixed`: The element is positioned relative to the initial containing block established by the viewport and does not move with scroll.
- `sticky`: The element is positonned according to the normal flow of the document, but behaves like `fixed` when scrolled out of view. If another element is positioned `sticky` nearby, they will "push" each other out of the way.

[https://developer.mozilla.org/en-US/docs/Web/CSS/position](https://developer.mozilla.org/en-US/docs/Web/CSS/position){:target="_blank"}

                    <h2><i class="fas fa-users"></i> Positionning - Examples</h2>

                    <style>
.position_example {
    display: grid;
    grid-template-columns: 1fr 1fr 1fr;
    grid-gap: 30px;
}
.position_example > div {
    border: 1px solid black;
    padding: 20px;
    background: whitesmoke;
    height: 200px;
    overflow: scroll;
    position: relative;
}
.layout {
    display: grid;
    grid-template-columns: 1fr;
    grid-gap: 10px;
}
.layout > div, .fixed_example .positionned {
    padding: 20px;
    background: rgb(200, 200, 200);
    text-align: center;
    border-radius: 5px;
}
.position_example div.positionned {
    background: rgb(192, 219, 255);
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.5);
}
.relative_example .positionned {
    position: relative;
    left: 20px;
    top: 20px;
}
.absolute_example .positionned {
    position: absolute;
    left: 20px;
    top: 20px;
}
.fixed_example .positionned {
    position: absolute;
    left: 20px;
    top: 20px;
}
.sticky_example .positionned {
    position: sticky;
    left: 20px;
    top: 20px;
}
                    </style>
                    
                    <div class="position_example">
<div class="static_example">
    <div class="layout">
        <div>1</div>
        <div class="positionned">2 <i>(static)</i></div>
        <div>3</div>
        <div>4</div>
    </div>
</div>
<div class="relative_example">
    <div class="layout">
        <div>1</div>
        <div class="positionned">2 <i>(relative)</i></div>
        <div>3</div>
        <div>4</div>
    </div>
</div>
<div class="absolute_example">
    <div class="layout">
        <div>1</div>
        <div class="positionned">2 <i>(absolute)</i></div>
        <div>3</div>
        <div>4</div>
    </div>
</div>
<div class="fixed_example" style="padding: 0; height: 240px">
    <div class="positionned">2 <i>(fixed)</i></div>
    <div style="overflow: scroll; height: 100%; padding: 20px;">
        <div class="layout">
            <div>1</div>
            <div>3</div>
            <div>4</div>
        </div>
    </div>
</div>
<div class="sticky_example">
    <div class="layout">
        <div>1</div>
        <div class="positionned">2 <i>(sticky)</i></div>
        <div>3</div>
        <div>4</div>
    </div>
</div>
                    </div>

### Common units

Relative units:
- **%** : percentage relative to a property of the parent element
- **em** : relative to the inherited font-size of the element
- **rem** : relative to the inherited font-size of the root element

Absolute units:
- **px** : pixels, should only be used for the screen
- **cm** : centimeters, should only be used for print
- **pt** : points, often used for setting font size for print (1pt = 1/72 of an inch)

Viewport units:
- **vw** : 1% of viewport width
- **vh** : 1% of viewport height
- **vmin** :  the smaller of vw and vh 
- **vmax** : the smaller of vw and vh

[https://developer.mozilla.org/en-US/docs/Web/CSS/length#units](https://developer.mozilla.org/en-US/docs/Web/CSS/length#units){:target="_blank"}

Notes:

It is good practice to prefer using `em` and `rem` units
for font sizes, as it allows easy resizing of entire
blocks of content by only resizing the font of a
container block. For example, reducing the font size on
a smartphone becomes as simple as reducing the font size
of the root element: all children elements that used
relative units will contain proportionally smaller text.

                    <h2><i class="fas fa-users"></i> Common units - Examples</h2>

                    <p>
Change the font size of the container to see the effect on all its descendants using relative units.
                    </p>
                    <div style="text-align: center">
<input type="text" name="container_font_size" value="18px" style="font-size: 0.8em;"
oninput="{
    console.log('Changing font size');
    document.getElementById('font_size_example').style.fontSize = this.value;
}"/>
                    </div>
                    <div class="vspace"></div>

                    <div style="width: 70%; margin: auto; background: whitesmoke; padding: 30px;">
<div id="font_size_example" style="font-size: 18px">
    <h1 style="font-size: 2em"><i style="text-transform: lowercase;"><b>(2em)</b></i> Header</h1>
    <p style="font-size: 1em"><i><b>(1em)</b></i> Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quam numquam ea suscipit nostrum quidem ipsum, quis tempora neque! Et animi, non voluptatem cumque totam officiis vitae? Totam ut labore enim!</p>
    <p style="font-size: 0.7em"><i><b>(0.7em)</b></i> Animi, soluta quaerat illo officia sequi expedita beatae ullam praesentium dolorum illum vitae blanditiis saepe labore! Cumque tenetur modi dicta harum sed nemo laborum architecto, dolorem porro saepe nisi. Corrupti corporis quibusdam rem ipsum nobis aperiam. Quas ex adipisci corrupti neque repellendus deserunt similique a reiciendis sint, voluptate laboriosam cupiditate quam! Rerum tempora quidem quo dignissimos at.</p>
</div>
                    </div>

### Calculations

CSS has a special calc() function for doing basic math.
    
```css
.header {
    font-size: calc(3vw + 2px);
    width: calc(100% - 20px);
    height: calc(100vh - 80px);
    padding: 20px calc(1vw + 5px) 20px;
}
```
 ## Flexbox

### Flexbox

The Flexbox layout (`display: flex`) aims at providing a more efficient way to lay out, align and distribute space among items in a container, even when their size is unknown and/or dynamic (thus the word “flex”).

```html
<div class="container">
    <div class="item">Item A</div>
    <div class="item">Item B</div>
    <div class="item">Item C</div>
</div>
```

```css
.container {
    display: flex;
    flex-direction: row;
}
.item {
    order: 1;
    flex-grow: 1
}
```

[https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_Flexible_Box_Layout/Basic_Concepts_of_Flexbox](https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_Flexible_Box_Layout/Basic_Concepts_of_Flexbox){:target="_blank"}

The Flexbox module is composed of a set of properites. Some are meant for the container whereas other are only meant for children items.

- **Container properties** : flex-direction, flex-wrap, flex-flow, justify-content, align-items, align-content
- **Children properties** : order, flex-grow, flex-shrink, flex-basis, flex, align-self

See the illustrations on **[CSS
tricks](https://css-tricks.com/snippets/css/a-guide-to-flexbox/)**
to learn about the potential of flexbox.

### References

**[MDN](https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_Flexible_Box_Layout)** provides a very good **interactive** tutorial on Flexbox.

**[CSS tricks](https://css-tricks.com/snippets/css/a-guide-to-flexbox/)** provides a very good **illustrated** tutorial on Flexbox.

**[Flexbox Froggy](https://flexboxfroggy.com/)** is a game to help you learn Flexbox.

**[Flexbox Defense](http://www.flexboxdefense.com/)** is a tower defense game to help you learn Flexbox.

**[Flexbox Zombies](https://mastery.games/p/flexbox-zombies)** is a game to help you learn Flexbox.

### Grid

In some scenarios, the grid layout is more convenient,
in particular for dynamically spreading content on a
grid structure.

<img src="assets/grid-layout.svg" style="width:60%"/>

See the illustrations on
[CSS-tricks](https://css-tricks.com/snippets/css/complete-guide-grid/)
to learn about the potential of grid.

### Grid - Areas

`grid-template-areas` allows trivial responsiveness for different screen sizes.

Play with CSS grids with [Grid Garden](https://cssgridgarden.com/).

### Media Queries

Media queries allow for conditionnal evaluation of rulesets.

They are useful to adapt the layout to different screen sizes and dimensions, or device types (print vs. screen.

```css
@media only screen and (min-width : 600px) {
    body {
        color: red
    }
}
```

[https://developer.mozilla.org/en-US/docs/Web/CSS/Media_Queries/Using_media_queries](https://developer.mozilla.org/en-US/docs/Web/CSS/Media_Queries/Using_media_queries){:target="_blank"}


### Mobile first

Media queries do not increase specificity, so the order matters.

```css
h1 { font-size: 50px; } /* General rule */

@media (min-width: 576px) { /* Tablet dimensions */
    h1 { font-size: 60px; }
}

@media (min-width: 768px) { /* Desktop dimensions */
    h1 { font-size: 70px; }
}
```

Here, the font-size of h1 is 50px on mobile, 60px on tablet and 70px on desktop.

[https://developer.mozilla.org/en-US/docs/Web/CSS/Media_Queries/Using_media_queries](https://developer.mozilla.org/en-US/docs/Web/CSS/Media_Queries/Using_media_queries){:target="_blank"}

## CSS Variables

CSS variables are defined with the `--` prefix.

They can by global or local

```css
:root { /* Global variables */
    --main-color: #06c;
    --main-bg-color: #fff;
}

.subcontent { /* Local variables ; override global variables */
    --main-color: #c06;
    --main-bg-color: #fff;
    --content-specific-color: #f00;
}
```

[https://developer.mozilla.org/en-US/docs/Web/CSS/Using_CSS_custom_properties](https://developer.mozilla.org/en-US/docs/Web/CSS/Using_CSS_custom_properties){:target="_blank"}


### Accessing variables

CSS variables are accessed with the `var()` function. Can be used wherever a value is expected.

```css
.my-element {
    color: var(--main-color);
    background-color: var(--main-bg-color);
}
```

The `var()` function can take fallback values in case one of the variables is not defined.

```css
.my-element {
    color: var(--main-color, #06c);
    background-color: var(--main-bg-color, #fff);
}
```
