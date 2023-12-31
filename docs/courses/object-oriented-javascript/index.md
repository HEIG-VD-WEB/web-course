# Object-oriented JavaScript

## Prototype-oriented JavaScript

### Recall JavaScript's Types

ECMAScript defines 7 **primitive** (Immutable) types for values:

```js
undefined; // Undefined
3.14; // Number
true; // Boolean
"Heig-vd"; // String
9007199254740992n; // BigInt
Symbol("Symbol") // Symbol
null; // Null (Structural root primitive)
```

ECMAScript defines a special mutable type called **object** for collections of properties (objects and array).

```js
{prop: "value"}; // Object
```

In a dynamic language you don't specify the type when you declare a variable and the type of a variable can change.

[https://developer.mozilla.org/en-US/docs/Web/JavaScript/Data_structures#Data_types](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Data_structures#Data_types){:target="_blank"}

### Objects

An object is a mutable unordered collection of properties.
A property is a tuple of a key and a value.
A property key is either a string or a symbol.
A property value can be any ECMAScript language value.


```js
let car = {
    make: 'Ford',
    model: 'Mustang',
    year: 1969
}
```

You can access the properties of an object using the **dot notation** (property names: `"^[a-z]+(_[a-z]+)+$"`):

```js
let car = new Object();
car.make = 'Ford';
car.model = 'Mustang';
car.year = 1969;
```

Properties can also be accessed or set using the **bracket notation**:

```js
let car = new Object();
car['make'] = 'Ford';
car['model'] = 'Mustang';
car['year'] = 1969;
```

[https://developer.mozilla.org/en-US/docs/Web/JavaScript/Guide/Working_with_Objects](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Guide/Working_with_Objects){:target="_blank"}

### Methods

When a function is stored as a property of an object, we call it a **method**.
When a method is invoked, the value of `this` inside the method is the object the method is called on.

```js
var apple = {
    color: 'red',
    toString: function() {
        return `This fruit is ${this.color}!`;
    }
}
console.log(apple.toString()); // This fruit is red!
```

When a function which is not the property of an object is invoked, `this` is bound to the **global** object.
This is an **error** in the design of the language as it prevent the definition of helper funtions.

```js
var color = 'blue';
var apple = {
    color: 'red',
    toString: function() {
        function helper() {
            return `This fruit is ${this.color}!`;
        }
        return helper();
    }
}
// TypeError: Cannot read properties of undefined (reading 'color')
console.log(apple.toString());
```

This issue can be addressed with:
- The `apply(this, args)`, `call(this, arg, ...)` or `bind(this)` methods of a `Function` object that redefine `this`.
- The arrow function expression that do not define its own `this` and takes the one present in its scope.


Notes:

- The `apply(this, args)` function is a method of `Function` instances, which allows to override the `this` object with one provided as argument. For example, given a `getName` method on a `Person` object, calling `getName.apply(animal, args)` will execute that `getName` function as if it had been called like `animal.getName(args)`.
- The `call(this, ...)` function is identical, except that the arguments are given directly, instead of in the form of an array.
- The `bind(this)` method of `Function` returns a new function whose `this` object is overridden with the provided one.

## The prototype property

Every object automatically has a prototype property,
intended to describe what that object is.

```js
var obj = {
  city: "Madrid",
  greet() { console.log("Welcome to ${this.city}!") }
}
```

<div class="r-stack" style="width: 80%; margin-inline: auto">
  <img class="fragment" src="./assets/obj1.png">
  <img class="fragment" src="./assets/obj2.png">
  <img class="fragment" src="./assets/obj3.png">
</div>

When an object's prototype property is the prototype
of another object, we say that the former *inherits*
from the second. Here, `obj` inherits from `Object`.

Notes:

All objects have a property holding a *prototype*
object. That property is often named `__proto__`,
but no standard enforces this. Note that this
prototype *is an object*, so it also has a prototype
property. This creates the *prototype chain*.

When an object is created, its prototype property is
automatically set to `Object.prototype`, the
prototype of the `Object` type. Note that,
`Object.prototype` being an object, it also has a
prototype property itself, but it is `null` since it
is the end of the prototype chain.

Whenever a property or method is requested on an
object, it is first searched for in that object, and
if not found, it is searched on its prototype, and
so on until it is found or the entire prototype
chain has been traversed.


### Prototypes on functions

Every function also has a prototype property. If a
function is used as a constructor, this prototype is
used as the newly created object's prototype. This
prototype automatically contains a `constructor`
property, pointing back to the function.

```js
function Person(name) {
    this.name = name;
}

const personPrototype = {
    greet() { console.log(`Hi, I'm ${this.name}!`)}
}

Person.prototype = Object.assign(Person.prototype, personPrototype);

const scott = new Person("Scott"); // using Person as a constructor
scott.greet();
```

The `Object.assign` function extends the prototype given as first argument with the properties of the prototype given as second argument.

<img src="./assets/scott.png">

Notes:

Every created function has a prototype property,
similarly to objects. However, this time it is named
`prototype`. The value of that property is what will
be used to populate the prototype property of any
object created using that function as a constructor.

To use a function as a constructor, it must be
called with the `new` keyword, in which case, the
`this` keyword in that function will refer to the
newly created object. Otherwise, it points to the
global object.

In this example, while we could do `Person.prototype
= personPrototype`, it is good practice to use the
`Object.assign(dst, src)` function: instead of
simply replacing the existing prototype with the
provided one, it *extends* the existing one with all
properties of the provided prototype.

See https://developer.mozilla.org/en-US/docs/Learn/JavaScript/Objects/Object_prototypes

### Prototype Inheritance building blocks

**`Object.create(proto)`**: Returns new empty object with prototype property equal to `proto`.

**`Object.assign(dst, src)`**: Extends `dst` object with all [enumerable](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/propertyIsEnumerable), [own](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/hasOwn) properties of `src`. *(Those are essentially the user-defined properties that are not inherited. Hence `constructor` and `__prop__` are *not* copied by `Object.assign`.)*

If we want that A inherits B, then we have to:

<ol>
  <li class="fragment" data-fragment-index="1"><code>Object.create</code> a new prototype object for <code>A</code> whose prototype property is <code>B</code>'s prototype.</li>
  <li class="fragment" data-fragment-index="2"><code>Object.assign</code> all enumerable own properties of <code>A</code>'s old prototype to the new one.</li>
  <li class="fragment" data-fragment-index="3">Since <code>Object.assign</code> does not copy <code>constructor</code> to the new prototype, do so manually.</li>
  <li class="fragment" data-fragment-index="4">Replace <code>A</code>'s prototype with the new one.</li>
</ol>

<div class="r-stack" style="width: 95%; margin-inline: auto">
  <img class="fragment" data-fragment-index="0" src="./assets/ab1.png">
  <img class="fragment" data-fragment-index="1" src="./assets/ab2.png">
  <img class="fragment" data-fragment-index="2" src="./assets/ab3.png">
  <img class="fragment" data-fragment-index="3" src="./assets/ab4.png">
  <img class="fragment" data-fragment-index="4" src="./assets/ab5.png">
</div>

                        </textarea>

### Prototype Inheritance

Example

```js
function Fruit(color) {
    this.color = color;
}
Fruit.prototype.toString = function() {
    return `This fruit is ${this.color}!`;
}

function Apple(color, name) {
    Fruit.call(this, color);
    this.name = name;
}
Apple.prototype.hasWorm = function() { return false; }

// Create a prototype object inheriting from Fruit.
let applePrototype = Object.create(Fruit.prototype);

// Move any Apple properties to that new prototype.
applePrototype = Object.assign(childProto, Apple.prototype);

// Reset the constructor
applePrototype.constructor = Apple;

Apple.prototype = applePrototype;

var apple = new Apple("red", "golden");
console.log(apple.toString()); // This fruit is red!
```

When a lookup fails on the apple object, it now falls back on the Fruit `prototype`.

### Consider the Array object

The `Array` object is a global object that is used in the construction of arrays; which are high-level, list-like objects.

```js
let fruits = ['Apple', 'Banana', 'Pear'];
```

Here, the `[]` notation is a **shorthand** for the `Array` constructor.


```js
let fruits = new Array('Apple', 'Banana', 'Pear');
```

`Array` is a function and the `new` operator changes its behavior:
- It creates a new object that inherits from the `Array.prototype` object.
- It binds the newly created object to the `this` keyword.
- It returns the newly created object unless the function returns another object.

[https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array){:target="_blank"}

### Overriding the prototype

Changes to an object's prototype are seen by all instances of that object. 
That's why it's called a prototype.

The properties and methods of prototypes can be **overridden** along the chain.

```js
var fruits = ['apple', 'banana', 'pear'];

console.log(fruits.toString()); // apple,banana,pear

Array.prototype.toString = function() {
    return `Array of size ${this.length}`;
}

console.log(fruits.toString()); // Array of size 3!
```

[https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/prototype](rototype){:target="_blank"}

### Putting it all together

As objects inherit properties from their prototype, we can say that JavaScript is a **prototype-based** language and not a **class-based** one.

While JavaScript does offer a class syntax, it is only **syntactic sugar** for the prototype-based inheritance system.

## Object-oriented JavaScript

### The Object-oriented Syntax

Introduced in ECMAScript 2015, classes are syntactic sugar over JavaScript's prototype-based inheritance. It is **not** a new object-oriented inheritance model.

```js
class Fruit {
    constructor(color) {
        this.color = color;
    }
    toString() {
        return `This fruit is ${this.color}!`;
    }
}
class Apple extends Fruit {
    constructor(color, name) {
        super(color);
        this.name = name;
    }
    toString() {
        return super.toString();
    }
}
let apple = new Apple("red", "golden");
console.log(apple.toString()); // This fruit is red!
```

- The `extends` keyword is used in class declarations or class expressions to create a class as the child of another class.
- The `constructor` method is a special method for creating and initializing an object described by a class.
- The `super` keyword is used to access and call functions on an object's parent.

[https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Classes](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Classes){:target="_blank"}

### Static properties and methods

The class syntax enables the use of `static` methods and properties, which are shared across all instances of the class.

```js
class Fruit {
    static name = "Fruit";
    static getName() {
        return this.name;
    }
}
console.log(Fruit.getName()); // Fruit
```

[https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Classes](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Classes){:target="_blank"}
                       
### Private properties and methods

The class syntax enables the use of `private` properties and methods, which are not accessible outside of the class.

```js
class Fruit {
    #name = "Fruit";
    getName() {
        return this.#name;
    }
}
let fruit = new Fruit();
console.log(fruit.getName()); // Fruit
console.log(fruit.#name); // SyntaxError: Private field '#name' must be declared in an enclosing class
```

[https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Classes](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Classes){:target="_blank"}
                        
### Getters and setters

The class syntax enables the use of `getters` and `setters` to access and modify properties.

```js
class Fruit {
    constructor(color) {
        this.color = color;
    }
    get color() {
        return this._color;
    }
    set color(value) {
        this._color = value;
    }
}
let apple = new Fruit("red");
console.log(apple.color); // red
apple.color = "green";
console.log(apple.color); // green
```

[https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Classes](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Classes){:target="_blank"}
                        
### Species

Sometimes, you want to create a new object of the same type as an existing object. 
For example, when you want to create a new array from an existing array, you want to create a new array of the same type.

The `Symbol.species` property allows you to do that by specifying the constructor function that is used to create derived objects.

```js
class MyArray extends Array {
    // Overwrite species to the parent Array constructor
    static get [Symbol.species]() { return Array; }
}

const a = new MyArray(1, 2, 3);
const mapped = a.map((x) => x * x);

console.log(mapped instanceof MyArray); // false
console.log(mapped instanceof Array);   // true
```

[https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Classes](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Classes){:target="_blank"}

Notes:

A lot of things are going on in this example.

**The `[...]()` syntax**

When defining an object's property, JavaScript allows us to provide an expression to be evaluated to that property's name, instead of providing an explicit name. That expression must then be surrounded by square brackets, which should remind you of how one can access an object's property through the same notation instead of the dot notation. This feature is called [Computed Property Names](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/Object_initializer#computed_property_names). For example, it can be used as follows

```js
var propName = getPropertyName(); // Get a dynamically generated string
const newObj = {
    [propName]: getPropertyValue(),
}
```

**`Symbol.species`**

Recall that `Symbol` represents a unique identifier. The `Symbol` class offers static properties that contain symbols created for specific intents. This is the case of `Symbol.species`: it is a symbol intended to be used as a property name of all objects, and that identifies a static getter returning the function to be used to instantiate that object. Writing `static get [Symbol.species]() { //...` thus means declaring a static getter whose identifier is the symbol stored as a static property of the `Symbol` class, `Symbol.species`, and whose value corresponds to the function that instantiates that object.

                        
### Mix-ins

Multiple inheritance is not supported in JavaScript, but it is possible to simulate it with mix-ins.

```js
const canWalk = (Base) => class extends Base {
    walk() {
        console.log("Walking...");
    }
};
const canEat = (Base) => class extends Base {
    eat() {
        console.log("Eating...");
    }
};
class Person extends canWalk(canEat(Object)) {
    constructor(name) {
        super();
        this.name = name;
    }
}
let person = new Person("John");
person.walk(); // Walking...
person.eat(); // Eating...
```

[https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Classes](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Classes){:target="_blank"}


### Modules

ECMAScript 6 introduced modules, a
reusable piece of code that can be
exported from one program and imported for
use in another program.

### Exporting

Any value can be exported (object, number, string, etc).

```js
// Export upon declaring a value
export function sum(a, b) { ... }
export const ANSWER = 42

// Export a declared value
export { val1, val2, ... }
```

An export can be made **default** by following `export` with `default`.

### Modules

ECMAScript 6 introduced modules, a
reusable piece of code that can be
exported from one program and imported for
use in another program.

### Importing

The imported script must be loaded as a module.

```html
<script type="module" src="path/to/module.js"></script>
```

The `import` statement must always be at the top of the file, before any other code.

```js
import { export1, export2, ... } from "module-name"; // import specific values
import { export1 as alias1, ... } from "module-name"; // import value with alias
import * as name from "module_name"; // import all into an object
import name from "module-name"; // import the default export
import "module-name"; // imports for side-effects; runs it but imports nothing.
```

[https://developer.mozilla.org/en-US/docs/Web/JavaScript/Guide/Modules](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Guide/Modules){:target="_blank"}

Notes:

Example

```js
// inside fruit.js
class Fruit {}
export Fruit;
```

```js
// inside apple.js
import Fruit from 'fruit.js';
class Apple extends Fruit {}
export Apple;
```

```js
// inside index.js
import Apple from 'apple.js';
console.log(new Apple());
```

```html
<!-- inside index.html -->
<script type="module" src="index.js"></script>
```
