# JavaScript

## What is JavaScript

JavaScript is a lightweight, **interpreted**, or **just-in-time** compiled programming language with first-class functions.

### Interpreted 
The interpreter reads the source code and executes it directly.
It does not require the compilation of the program into machine-code.

### Just-in-time (JIT) compiled
The interpreter compiles the hot parts of the source code into machine-code and executes it directly.
The rest of the program is interpreted.

### First-class functions
Functions are treated like any other value.
They can be stored in variables, passed as arguments to other functions, created within functions, and returned from functions.

[https://developer.mozilla.org/en-US/docs/Web/JavaScript](https://developer.mozilla.org/en-US/docs/Web/JavaScript){:target="_blank"}

JavaScript is a **prototype-based**, multi-paradigm, **dynamic** language, supporting **object-oriented**, **imperative**, and **declarative** (e.g. functional programming) styles.

### Dynamic
Performs at runtime what static languages perform at compilation time (e.g. dynamic typing).

### Prototype-based and object-oriented
Behavior reuse (and inheritence) is achieved by cloning and extending objects.

### Imperative
Imperative programming is a programming paradigm that uses statements that change a program's state.

### Declarative
Declarative programming is a programming paradigm that expresses the logic of a computation without describing its control flow.

[https://developer.mozilla.org/en-US/docs/Web/JavaScript](https://developer.mozilla.org/en-US/docs/Web/JavaScript){:target="_blank"}

### ECMAScript

ECMAScript (or ES) is a specification created by ECMA International to standardize JavaScript.

<img src="assets/js_history_es6.png" alt="JavaScript History" style="width: 80%; margin-top: 100px;">


Notes:

Birth  

- 1994: Netscape Navigator is released, quickly becomes the most-used.  
- Web pages can then only be static, so Netscape added a scripting language to their navigator: a language created by newly-hired Brendan Eich, similar syntax to Java, called LiveScript in its beta, and then renamed to JavaScript at its release.
- Invented by Brendan Eich in 1995. He was also the cofounder of Mozilla.

Standardization

- 1996, Netscape meets with ECMA to standardize JavaScript. Happens in 1997.

Adoption

- 1999: third major release comes out, ES3. Internet Explorer is the new best explorer

Asynchronicity

- 1999: AJAX (Asynchronous Javascript and XML) arrives in JS and is quickly adopted. Essentially decouples data communication with data presentation, allowing more dynamic web pages.

JSON

- 2009: ES5 comes out, JSON becomes standard
- JSON first showed up in 2001, informally specified in 2006, and then officially standardized in 2013.

ES6: 2015

ES7: 2016

etc

### JavaScript on the server?

Not a modern idea:

- 1996: Microsoft and Netscape offered JS as a backend language.
- 1997: Rhino, a JS engine written in java.
- 2009: Ryan Dahl creates `node.js`, a JS environment for the server based on [V8](https://v8.dev/), an open source JS engine created in 2008 by Lars Bak for Chrome.
- 2018: Ryan Dahl creates Deno, a new runtime for JavaScript and TypeScript based on V8 and Rust.
- 2019: Oracle releases the first stable version of GraalVM, making JavaScript a high performance language for the JVM, later integrated in their RDBMS through MLE.

<img src="assets/logo_v8.png" style="width: 150px; float: left" />

<img src="assets/logo_nodejs.png" style="margin-left: 40px;width: 130px; float: left" />

### Client-side and Server-side Programming

Today, JavaScript is commonly used in browsers (client-side), on servers (server-side), and at the edge (cloudflare, fastly, etc.).

<img src="assets/Fetching_a_page.png" style="width: 60%; margin-top: 40px" />

### ECMAScript 6 Support

<img src="assets/js_compat_table.png" style="width: 70%" />

[https://kangax.github.io/compat-table/es6/](https://kangax.github.io/compat-table/es6/){:target="_blank"}

### Eloquent JavaScript

<img src="assets/js_eloquent_javascript.jpg" style="width: 25%" />

[https://eloquentjavascript.net/](https://eloquentjavascript.net/){:target="_blank"}

### JavaScript: The Good Parts

<img src="assets/javascript-good-parts.webp" style="width: 60%" />

[https://www.oreilly.com/library/view/javascript-the-good/9780596517748/](https://www.oreilly.com/library/view/javascript-the-good/9780596517748/){:target="_blank"}

## Foundations of JavaScript

### Client-side JavaScript

Adding JavaScript to a Web page is as simple as adding a `script` tag to the HTML document.

```html
<script type='text/javascript'>
  console.log('Hello, World!');
  document.writeln('Hello, World!')
</script>
```

The `src` attribute is used to specify the location of the JavaScript file.

```html
<script src="script.js"></script>
```

The `type` attribute is used to specify the type of the script. The default value is `text/javascript`. The `module` value is used to load a JavaScript module (ECMAScript 6).

The `defer` attribute is used to defer the execution of the script until the page has been loaded.

The `async` attribute is used to load the script asynchronously.

### Server-side JavaScript

After installing nodejs, a REPL (Read-Eval-Print-Loop) can be obtained by typing the node command:

```bash
$ node
Welcome to Node.js v12.8.0.
Type ".help" for more information.
> console.log("Hello, World!")
Hello World!
```

[https://nodejs.org/api/repl.html](https://nodejs.org/api/repl.html){:target="_blank"}

### Get to know the REPL commands

`.clear` - Reset the REPL context to an empty object and clears any multi-line expression currently being input.

`.exit` - Close the I/O stream, causing the REPL to exit.

`.help` - Show this list of special commands.

`.save` - Save the current REPL session to a file: > .save ./file/to/save.js

`.load` - Load a file into the current REPL session. > .load ./file/to/load.js

`.editor` - Enter editor mode (<ctrl>-D to finish, <ctrl>-C to cancel).

[https://nodejs.org/api/repl.html#repl_repl_commands](https://nodejs.org/api/repl.html#repl_repl_commands){:target="_blank"}

### JavaScript's Types

ECMAScript defines 7 **primitive** (Immutable) types for values:

- `Undefined`: Unique value `undefined`
- `Number`: Real or integer number (e.g. `3.14`, `42`)
- `Boolean`: `true` or `false`
- `String`: Character sequence, whose literals begin and end with single or double quotes (e.g. `"HEIG-VD"`, `'hello'`)
- `BigInt`: Arbitrary-precision integers, whose literals end with an `n` (e.g. `9007199254740992n`)
- `Symbol`: Globally unique values usable as identifiers or keys in objects (e.g. `Symbol()`, `Symbol("description")`)
- `Null`: Unique value `null`

In a dynamic language you don't specify the type when you declare a variable and the type of a variable can change.

ECMAScript also defines a special mutable type called **object** for collections of properties (objects and array).

[https://developer.mozilla.org/en-US/docs/Web/JavaScript/Data_structures#Data_types](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Data_structures#Data_types){:target="_blank"}

Notes:

The `Symbol` data type is special.

Calling `Symbol("description")` creates a symbol
value with description `"description"`.  That value
is guaranteed to be unique in the entire execution
context (hence even across different libraries or
modules). Therefore, two calls to `Symbol("desc")`
will return two different values.

It can be used anywhere an identifier or a key is
expected, so for example an object `car` (see next
chapter) could have a property whose index is
`Symbol("model")`, rather than simply
`"model"`. This would ensure that this property does
not get overridden by mistake by an inheritting
class (see next chapter on OOP), for example.

### Objects

An object in JavaScript is a mutable unordered
collection of properties, each being

- A property key (either a string or a symbol)
- A value (any ECMAScript language value)

The syntax for creating an object is as follows.

```js
let car = {
    make: "Ford",
    model: "Mustang",
    year: 1969
}
```

Properties of an object can be accessed through the
**dot notation**, or the **bracket notation**.

```js
car.model = "Mustang";
car["model"] = "Mustang";
```

We will learn more about objects (and
object-oriented programming in JS) in the next
chapter.

### Arrays

Arrays are a globally defined, resizable, list-like object. **They can contain a mix of different
data types.**

```js
let fruits = ['Apple', 'Banana', 'Pear'];
```

Accessing items of a list can be done with square
brackets. Items are zero-indexed. The `length`
property returns the array's length

```js
let fruit = fruits[0];
let l = fruits.length;
```

Various useful methods exist on arrays for modifying them.
```js
fruits.push("mango", "papaya"); // Appends new items
fruits.pop(); // Removes and returns the last item
fruits.reverse(); // Reverses the items' order
fruits.splice(2, 1, 'Orange'); // Replaces 1 elemnt at position 2 with 'Orange'
fruits.splice(1, 0, 'Peach'); // Inserts 'Peach' at index 1
```

We will learn more about arrays in the next chapter about Object-oriented JavaScript.

### typeof Operator

The `typeof` operator is useful for determining the type of a variable or a value.

The operand can be of any type:
- If the operand is a primitive value, `typeof` returns a string indicating the type of the primitive value.
- If the operand is an object, `typeof` returns `"object"`.

```js
console.log(typeof 1);  // number
console.log(typeof {}); // object

// what about typeof null? ;)
console.log(typeof null);
// and typeof Array? ;)
console.log(typeof [1, 2, 3]);
```

Notes:

Note that `typeof null` returns `"object"`. This
could be considered a bug of the `typeof` operator,
as we have seen that `null` is theoretically of type
`Null`.

Note also that an Array falls in the category of
objects.

Regarding Array, we have seen that arrays are actually objects under the hood. See OOP chapter to understand why in detail.

### Arithmetic Operators

An arithmetic operator takes numerical values (either literals or variables) as their operands and returns a single numerical value.

```js
1 + 1; // addition
1 - 1; // subtraction
1 / 1; // division
1 * 1; // multiplication
1 % 1; // modulo
1 ** 1; // exponentiation
```

[https://developer.mozilla.org/en-US/docs/Web/JavaScript/Guide/Expressions_and_Operators](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Guide/Expressions_and_Operators){:target="_blank"}

### String Operators

The concatenation operator (+) concatenates two string values together, returning another string that is the union of the two operand strings.

```js
"con" + "cat" + "e" + "nate";
```

In practice, prefer template literals to concatenation.

```js
`PI = ${Math.PI}`; // template literals
```

[https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Template_literals](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Template_literals){:target="_blank"}

### Assignment Operators

An assignment operator assigns a value to its left operand based on the value of its right operand.

```js
let a = 1; 

// arithmetic assignments
a += 1; // addition
a -= 1; // subtraction
a *= 1; // multiplication
a /= 1; // division
a %= 1; // modulo
a **= 1; // exponentiation
```

JavaScript also has increment and decrement unary operators
```js
a++; // increments and returns value before incrementing
++a; // increments and returns result of incrementing
a--; // decrements and returns value before decrementing
--a; // decrements and returns result of decrementing
```

[https://developer.mozilla.org/en-US/docs/Web/JavaScript/Guide/Expressions_and_Operators](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Guide/Expressions_and_Operators){:target="_blank"}

### Destructuring Assignment

The destructuring assignment syntax is a JavaScript expression that makes it possible to unpack values from arrays, or properties from objects, into distinct variables.

```js
var [a, b] = [1, 2];
console.log(a); // 1
console.log(b); // 2

var [a, b, ...rest] = [1, 2, 3, 4, 5];
console.log(a); // 1
console.log(b); // 2
console.log(rest); // [3, 4, 5]

var {a, b} = {a: 1, b: 2};
console.log(a); // 1
console.log(b); // 2

var {a, b, ...rest} = {a: 1, b: 2, c: 3, d: 4};
console.log(a); // 1
console.log(b); // 2
console.log(rest); // {c: 3, d: 4}
```

[https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/Destructuring_assignment](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/Destructuring_assignment){:target="_blank"}

### Logical and Ternary Operators

Logical expressions are evaluated from left to
right. JavaScript allows "short-circuit" evaluation.

```js
!true          // false
true && false  // false
true || false  // true
true ? a : b   // a
```

[https://developer.mozilla.org/en-US/docs/Web/JavaScript/Guide/Expressions_and_Operators](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Guide/Expressions_and_Operators){:target="_blank"}

Notes:

Short-circuit evaluation allows JavaScript to bypass
evaluation of the second term of a logical operation
if the first one suffices to determine the result of
the operation. This can happen in two cases:

- `a && b` : `b` will *not* be evaluated if `a` is **`false`**, since the result will be **`false`** regardless of `b`.
- `a || b` : `b` will *not* be evaluated if `a` is **`true`**, since the result will be **`true`** regardless of `b`.

### Optional chaining (?.)

The optional chaining operator (?.) permits reading the value of a property located deep within a chain of connected objects without having to expressly validate that each reference in the chain is valid.

```js
const adventurer = {
    name: 'Alice',
    cat: {
        name: 'Dinah'
    }
};
  
console.log(adventurer.dog?.name); // expected output: undefined
```

In this example, if we had omitted the `?` symbol, it would have failed with a `TypeError: adventurer.dog is undefined`.
    
Introduced with ECMA2020.

[https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/Optional_chaining](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/Optional_chaining){:target="_blank"}
        
### Comparison Operators

Comparison operators return a logical value based on whether the comparison is true. 

```js
1 == 1;
1 != 2;
1 < 2;
2 > 1;
1 <= 1;
1 >= 1;
```

**Automatic type conversion** is performed when comparing values of different types.
It is at the root of many issues when using comparison operators.

```js
"1" == 1 // true (!!!)
false == 0 // true
8 * null // 0
```

**Strict equality** compares both the type and the value.
It is recommended to use strict equality (===) and strict inequality (!==) operators.

```js
  "1" === 1 // false
  "1" !== 1 // true
```

[https://developer.mozilla.org/en-US/docs/Web/JavaScript/Guide/Expressions_and_Operators](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Guide/Expressions_and_Operators){:target="_blank"}

### Variable declaration statements

The `var` statement declares a **non-block-scoped** variable, optionally initializing it to a value. Its scope is its current execution context, i.e. either the enclosing function or, if outside any function, global. It can be **re-declared**.

```js
var x = 1;
if (true) { var x = 2; } // same variable
console.log(x); // 2
```

The `let` statement declares a **block-scoped** local variable, optionally initializing it to a value. Its scope is the block in which it is declared.

```js
let x = 1;
{ let x = 2; } // different variable
console.log(x); // 1
```

The `const` statement declares a **block-scoped** constant. The value of a constant cannot change through re-assignment, and it can't be redeclared.

```js
const x = 1;
x = 2; // TypeError: Assignment to constant variable.
```

A single statement can define multiple variables or constants: `let one = 1, two = 2;`.

Notes:

The differences between `var` and `let` are important.

### Scope

- The scope of a `var` is its enclosing function, or global. This means a `var` declared in an `if` block will still exist outside that block.
- The scope of a `let` is its enclosing **block**, meaning a `let` variable declared in an `if` block will no longer exist otside that block.

### Re-declaration

A `var` can be re-declared, in which case the previous declaration is overridden. On the other hand, trying to re-declare a `let` variable will result in an error.

### Conditional Execution

In JavaScript, conditional execution is controlled by the `if` statement.

```js
let num = prompt("Enter a number");
if (num > 0) {
    alert(`${num} is positive`);
} else if (num < 0) {
    alert(`${num} is negative`);
} else {
    alert(`${num} is zero`);
}
```

### Switch

Sometimes a switch looks better than an `if...elseif...else` statement.

```js
let val = prompt("Enter a letter");
switch(val) {
  case "a":
    alert("a");
    break;
  case "b":
    alert("b");
    break;
  default:
    alert("Not a or b");
    break;
}
```

### While and Do While

*while* and *do while* are used to loop until a condition is met.

```js
let num = 0;
while (num < 10) {
  console.log(num);
  num += 1;
}
```

```js
let echo = "";
do {
    echo = prompt("Echo");
    console.log(echo);
} while (echo != "stop");
```


### For Loops

The classic `for` statement is used to loop a given number of times over a block.

```js
for (let num = 0; num < 10; num++) {
    console.log(num);
}
```

The `for...in` statement iterates over the enumerable properties of an object.

```js
let obj = {a: 1, b: 2, c: 3};
for (var prop in obj) {
    console.log(prop, obj[prop]);
}
```

The `for...of` statement creates a loop iterating over iterable objects.

```js
let nums = [0, 1, 2, 3, 4, 5, 6, 7, 8 , 9];
for (let num of nums) {
    console.log(num);
}
```

Notes:

Note that you can thus use `for...in` on an array, which would iterate over the array's *properties*, rather than its *items*. Because of how arrays are implemented as objects in JavaScript, its properties are its indices, so the following code

```js
let primes = [1, 2, 3, 5, 7, 11];
for (let i in primes) {
    console.log(i);
}
```

would print `0`, `1`, `2`, `3`, `4`, and `5`, i.e. the indices of the array.

### JavaScript Break and Continue

The `break` statement terminates the current loop.

The `continue` statement terminates the execution of the current iteration and continues the execution of the loop with the next iteration.

`break` and `continue` can also be used with labelled statements, but please don't.

```js
mylabel:
for (let num = 0; num < 5; num++) {
  if (num === 5) {
    continue mylabel;
  }
  console.log(num)
}
```

[https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Statements/label](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Statements/label){:target="_blank"}

### JavaScript Exceptions
 
In Javascript, runtime errors can be handled using the `try...catch` statement.

```js
try {
  variable; // ReferenceError: variable is not defined
} catch (error) {
  // Fails silently
}
```

Exceptions can be triggered  using `throw` and `Error`:

```js
throw new Error("AAHHARG!!!");
```

Notes:

There are two types of errors in
JavaScript: **Runtime** and **Syntax**
errors. Because Syntax errors are thrown
in the syntax checking phase, which occurs
before the corresponding block is even
entered, a try-catch block will *not*
catch a syntax error. Only runtime errors,
which are thrown when the block is being
executed, are caught by try-catch blocks.

### JavaScript Functions

A function is created with an expression that starts with the keyword `function` and can be assigned to a regular variable.
It can have parameters and may `return` a value.

#### Declaration Notation

```js
function square(x) {
  return x * x;
}
// or
var square = function(x) {
    return x * x;
}
```

#### Arrow Notation

```js
var square = x => x * x
// or
var square = (x) => {
  return x * x;
} 
```


### JavaScript Function Parameters

Function parameters can be made optional by specifying default values.

```js
var square = function(x = 2) {
  return x * x;
}
console.log(square()) // 4
console.log(square(3)) // 9
console.log(square(undefined)) // 4
```

The default value is used if
- that argument is not provided, or
- `undefined` is provided.

This means that optional parameters need not be last.

By default, the default value of a parameter is `undefined`.

### JavaScript Recursion

It is fine for a function to call itself.

```js
function factorial(n) {
  return n == 1 ? n : n * factorial(n-1); 
}
console.log(factorial(5)) // 5 * 4 * 3 * 2 * 1 = 120
```

.. as long as it does not overflow the call stack.

### JavaScript Function Scopes

**Definition**: The scope of a variable is the part of the program
(block or function) in which it exists and can be used.

- `var` variables: local to the **function body**, or **global** if not defined in a function.

- `let` or `const` variables: local to the **block** in which they are declared.

- Function parameters: local to the **function body**. <span class="detail">  They are added to the **call stack** every time a function is called and freed when the function returns. </span>

### Higher-Order Functions

Higher-order functions allow us to abstract over actions, not just values. 
For example, we can have functions that create new functions.

```js
function greaterThan(n) {
    return m => m > n;
}
let greaterThan10 = greaterThan(10);
console.log(greaterThan10(11)); // true
```

[https://eloquentjavascript.net/05_higher_order.html](https://eloquentjavascript.net/05_higher_order.html){:target="_blank"}

### JavaScript Closure

A closure is the combination of a function and the local scope within which that function was declared.

```js
function wrap(value) {
  let v = value;
  return () => v;
}
console.log(wrap(1)()); // 1
```

Try to implement a counter using a closure?

Notes:

<div class="spoiler">

```js
function getCounter() {
  let count = 0;
  return () => count++;
}
let c = getCounter();
console.log(c()); // 0
console.log(c()); // 1
```
    
</div>

## Regular Expressions

### Regular Expressions

Regular expressions are patterns used to **match** and **extract** character combinations in strings. 

It is useful for validating inputs, parsing files, extracting information from free text.

For instance, given the format for [registration plates](https://fr.wikipedia.org/wiki/Plaque_d%27immatriculation_suisse
) in Switzerland: 
- Validate that the given string is a valid registration plate
- Extract all the registration plates listed in a unstructured text 

[https://developer.mozilla.org/en-US/docs/Web/JavaScript/Guide/Regular_Expressions](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Guide/Regular_Expressions){:target="_blank"}

### Building Regular Expressions

The following notations can be used to define a
regular expression in JavaScript. The description of
the regular expression must be surrounded by "`/`"
symbols.

```js
const re1 = /ab+c/;
const re2 = new RegExp(/ab+c/);
```

A regular expression is usually built with the following constructs:

- **Character Classes** (`.`, `\s`, `\d`, ...) that distinguish types of chararters (resp. any, whitespace or digit)
- **Character sets** (`[A-Z]`, `[a-z]`, `[0-9]`, `[abc]`, ...) that match any of the enclosed characters (resp. uppercase letters, lowercase letters, digits, and any of `a`, `b` or `c`)
- **Either operator** (`x|y`) that match either the left or right handside values
- **Quantifiers** (`*`, `+`, `?`, `{n}`, `{n,m}`) that indicate the number of times an expression matches
- **Boundaries** (`^`, `$`) that indicate the beginnings and endings of lines and words
- **Groups** (`()`, `(?<name>)`, `(?:)`) that extracts and remember (or not) information from the input 
- **Assertions** (`x(?=y)`) that helps at defining conditional expressions

[https://developer.mozilla.org/en-US/docs/Web/JavaScript/Guide/Regular_Expressions](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Guide/Regular_Expressions){:target="_blank"}

### Fun with Flags

Regular expressions have optional flags that allow for functionality like global and case insensitive searching.

```js
const re1 = /ab+c/; // no flag
const re2 = /ab+c/g; // global search
const re3 = /ab+c/i; // case-insensitive search
const re4 = /ab+c/m; // multi-line search

const re5 = /ab+c/gi // global case-insensitive search
```

[https://developer.mozilla.org/en-US/docs/Web/JavaScript/Guide/Regular_Expressions](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Guide/Regular_Expressions){:target="_blank"}

Notes:

- A *global* regular expression is intended to be tested against all possible matches in a string, as opposed to consider the first match sufficient.
- A *multiline* regular expression is intended to be tested on a string with multiple lines. In particular, it indicates that the special `^` an `$` symbols match the beginning and end of lines, rather than of the entire string.

Other flags exist, such as `s` to allow the `.` symbol to match newline characters or `u` to treat the pattern as a sequence of unicode code points. See [here](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Guide/Regular_Expressions#advanced_searching_with_flags) for a full list.

### Executing Regular Expressions

The following notations can be used to execute regular expressions.

```js
const re = /ab+c/;

console.log(re.test("ac")); // false
console.log(re.test("abc")); // true
console.log(re.test("abbc")); // true
console.log(re.test("abbbc")); // true

console.log(re.exec("ac")); // null
console.log(re.exec("abbc")); // ['abbc', index: 0, input: 'abbc', groups: undefined]

console.log(JSON.stringify([..."ac abc abbc abbbc".matchAll(/ab+c/g)])); 
// [["abc"],["abbc"],["abbbc"]];
```

In addition to `matchAll`, a string comes with the `match`, `replace`, `search` and `split` methods.

[https://developer.mozilla.org/en-US/docs/Web/JavaScript/Guide/Regular_Expressions](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Guide/Regular_Expressions){:target="_blank"}

- Example of a regular expression that extracts the canton and the number of a Swiss registration plates.

```js
let plate = "BE.1234"
// extract canton and number
let re = /([A-Z]{2})\.?([0-9]{1,6})/;
let [_, canton, number] = plate.match(re);
```

- Example of a regular expression that extracts a list of Swiss registration plates from a free text.

```js
// Text containing swiss license plates
let text = getText()
// extract all license plates
let re = /[A-Z]{2}\.?[0-9]{1,6}/g;
let plates = [...text.matchAll(re)];
```

Notes:

[https://regexr.com](https://regexr.com){:target="_blank"}

[https://regex101.com/](https://regex101.com/){:target="_blank"}
