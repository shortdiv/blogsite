---
title: "Curveball"
description: ""
tags: [advent, frontend, threejs]
categories: []
date: 2019-12-03T22:58:23-06:00
draft: false
---

Most shapes in ThreeJS and WebGL can be created using primitives many of which, you can use to create composite geometries, like [this really neat christmas tree](https://codepen.io/josephrexme/pen/YEemvw). Creating complex and unique geometries however takes effort and can be difficult to achieve by simply compositing, mutating and ”extruding” existing primitives in ThreeJS. A better approach, as I highlighted in a previous post, is to utilize the methods like `Geometry` in ThreeJS that give you the flexibility of defining vertices and faces for custom polyhedrons. In addition to this, ThreeJS also offers support for working with curves and smooth surfaces. `ParametricGeometry` is example of such a method that gives you the ability to work with parametric surfaces, or surfaces which extend the idea of [parametrized curves](https://mathinsight.org/parametrized_curve_introduction) (fancy terms for bézier curves) to vector-valued functions of two variables—from my understanding this basically means a 3D non straight surface.

According to [this very credible math website](http://math.hws.edu/graphicsbook/c5/s2.html), a parametric surface is defined by a mathematical function *f*(*u,v*), where *u* and *v* are numbers, and each value of the function is a point in space. The surface consists of all the points that are values of the function for *u* and *v* in some specified ranges.

If we translate this into ThreeJS language, that function is an ordinary plain old JS function that returns values of type `THREE.Vector3`. That function looks something like this: 

```js
function surfaceFunction( u, v ) {
    var x,y,z;  // A point on the surface, calculated from u,v.
                // u  and v range from 0 to 1.
    x = 20 * (u - 0.5);  // x and z range from -10 to 10
    z = 20 * (v - 0.5);
    y = 2*(Math.sin(x/2) * Math.cos(z));
    return new THREE.Vector3( x, y, z );
}
```

With this surface function, you can then pass it into `Three.ParametricGeometry` alongside some slices and stacks that are used to determine number of points in the grid to give us a parametric surface. 

```js
var slices = 64;
var stacks = 65
var surfaceGeometry = new THREE.ParametricGeometry(surfaceFunction, slicesstacks);
var surface = new THREE.Mesh( surfaceGeometry, material );
```

## A quick note about slices and stacks

If you’ve never done much with parametric equations, the concept of slices and stacks may be slightly confusing. Slices and stacks are simply *polygonal approximations* that are the computer’s way of rendering curved surfaces. The reasoning for this is that computers find it hard to draw curves. And curves in 3D are especially hard to compute. To address this, computers approximate curves with the help of polygons. This may not seem evident from using ThreeJS because of all the helper methods for drawing curves, but in raw WebGL, creating a curve requires using a limited set of triangle based primitives; triangle, triangle strip and triangle fan to be precise. Drawing a circle would therefore require using triangle fan like so: 


![](https://paper-attachments.dropbox.com/s_95FE1B27B649AC1958BC9742DDCF74C78FAB26D1FD4AF2C4244B52806EA10A83_1575418339979_trianglefan.png)


The triangle fan primitive we use in WebGL creates an N sided polygon that sort of represents a circle. These N sides are called slices, notice how the triangle bits look like slices of a pie? Stacks are the same concept of slices, except in the other dimension. 

All this theory aside, I still haven’t managed to get it working in ThreeJS in [codepen](https://codepen.io/shortdiv/pen/YzPPQYv?editors=1010). Better luck tomorrow! 

