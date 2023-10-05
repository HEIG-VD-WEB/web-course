# Drawing in the HTML Canvas

## Initializing a Canvas

The Canvas API provides a means for drawing graphics via JavaScript and the `canvas` element.

```html
<canvas id="canvas" width="800" height="600" />
```

```js
let canvas = document.getElementById("canvas");
const ctx = canvas.getContext('2d');

// setting the context properties
ctx.strokeStyle = 'blue';
ctx.fillStyle = 'green';

// clearing the canvas
ctx.clearRect(0, 0, 100, 100);
```

[https://developer.mozilla.org/en-US/docs/Web/API/Canvas_API](https://developer.mozilla.org/en-US/docs/Web/API/Canvas_API){:target="_blank"}
                       
## Drawing in the Canvas

Writing some text:

```js
ctx.fillText("test", 30, 10); // fillText(text, x, y)
```

Filling a rectangle:

```js
ctx.fillRect(10, 10, 150, 100); // fillRect(x, y, width, height)
```

Drawing an arc:

```js
ctx.beginPath();
ctx.arc(50, 50, 10, 0, Math.PI); // arc(x, y, radius, startAngle, endAngle, counterclockwise = false)
ctx.stroke();
```

Free drawing:

```js
ctx.beginPath();
ctx.lineTo(20, 20); // lineTo(x, y)
ctx.lineTo(50, 50);
ctx.stroke();
```

[https://developer.mozilla.org/en-US/docs/Web/API/Canvas_API](https://developer.mozilla.org/en-US/docs/Web/API/Canvas_API){:target="_blank"}
                 
## Transformations in the Canvas

Transformations enables more powerful ways to translate the origin to a different position, rotate the grid and even scale it.

Canvas states are stored on a stack:
- When the `save()` method is called, the current drawing state is pushed onto the stack.
- When the `restore()` method is called, the last saved state is popped off the stack and all saved settings are restored.

When you perform transformations on the grid to draw an object you often want to restore a prior state to draw the next object.

```js
ctx.fillStyle = 'rgb(0, 0, 255, 0.4)';
ctx.save();
angle = 0;
while (angle < Math.PI/2) {
    ctx.translate(200, 200);
    ctx.rotate(Math.PI / 10);
    ctx.translate(-200, -200);
    ctx.fillRect(170, 170, 60, 60);
    angle += Math.PI / 10;
}
ctx.restore();
```

[https://developer.mozilla.org/en-US/docs/Web/API/Canvas_API/Tutorial/Transformations](https://developer.mozilla.org/en-US/docs/Web/API/Canvas_API/Tutorial/Transformations){:target="_blank"}
                       
## Rendering Loop and Game Loop

The [setTimeout](https://developer.mozilla.org/en-US/docs/Web/API/WindowOrWorkerGlobalScope/setTimeout) method sets a timer which executes a function or specified piece of code once the timer expires.

The [setInterval](https://developer.mozilla.org/en-US/docs/Web/API/WindowOrWorkerGlobalScope/setInterval) method, offered on the Window and Worker interfaces, repeatedly calls a function or executes a code snippet, with a fixed time delay between each call.

The [requestAnimationFrame](https://developer.mozilla.org/en-US/docs/Web/API/window/requestAnimationFrame) method tells the browser that you wish to perform an animation and requests that the browser call a specified function to update an animation before the next repaint.

[https://developer.mozilla.org/en-US/docs/Learn/JavaScript/Asynchronous/Timeouts_and_intervals](https://developer.mozilla.org/en-US/docs/Learn/JavaScript/Asynchronous/Timeouts_and_intervals){:target="_blank"}
                        