---
title: "Walking at angles"
description: ""
tags: [advent, frontend, threejs]
categories: []
date: 2019-12-02T21:45:21-06:00
draft: false
---

# Walking at angles
When drawing in 3D and even in 2D, we rely on shapes to make up a larger geometry, which then go on to form a more complex scene. This may seem rather straightforward but to a machine the task of drawing shapes could not be more complicated. This is largely because most machines only know how to render triangles. Take the humble square. Ordinarily, a square is drawn from point to point around the perimeter of the square, so in the figure below we’d draw a square from 1 → 2 → 3 → 4. From a computer’s perspective however, drawing a square would go 1 → 2 → 4 → 3. 


![](https://paper-attachments.dropbox.com/s_46AA37F21548B85905850A2B37486B7C1120DBCB41BFCD65ED229B927ECE2CEC_1575335773920_primitives.png)


This task of drawing a square becomes more complex when drawing in 3D. We’re no longer just dealing with points, we have to also think about vertices and faces so the shape has perspective. A vertex is a point where two or more lines meet to form an angle, and a face is the flat surface bounded by edges in a 3D object. If you were to create a cube in ThreeJS without relying on primitives like `BoxGeometry` or `BoxBufferGeometry` you would need both vertex and face.

With primitive:

```js
var geometry = new THREE.BoxGeometry(1, 1, 1) 
// OR 
var geometry = new THREE.BoxBufferGeometry(1, 1, 1)
```
Without primitives:

```js
const geometry = new THREE.Geometry();

geometry.vertices.push(
  new THREE.Vector3(-1, -1,  1),  // 0
  new THREE.Vector3( 1, -1,  1),  // 1
  new THREE.Vector3(-1,  1,  1),  // 2
  new THREE.Vector3( 1,  1,  1),  // 3
  new THREE.Vector3(-1, -1, -1),  // 4
  new THREE.Vector3( 1, -1, -1),  // 5
  new THREE.Vector3(-1,  1, -1),  // 6
  new THREE.Vector3( 1,  1, -1),  // 7
);
    
geometry.faces.push(
  // front
  new THREE.Face3(0, 3, 2),
  new THREE.Face3(0, 1, 3),
  // right
  new THREE.Face3(1, 7, 3),
  new THREE.Face3(1, 5, 7),
  // back
  new THREE.Face3(5, 6, 7),
  new THREE.Face3(5, 4, 6),
  // left
  new THREE.Face3(4, 2, 6),
  new THREE.Face3(4, 0, 2),
  // top
  new THREE.Face3(2, 7, 6),
  new THREE.Face3(2, 3, 7),
  // bottom
  new THREE.Face3(4, 1, 0),
  new THREE.Face3(4, 5, 1),
);
```

If we were to compare the above two code snippets, it’s pretty clear that common shapes (like cubes) are easier drawn with primitives. Even so, vertexes and faces become relevant when it comes to creating custom geometry. To keep things simple, and highlight how vertices and faces are used to create a shape, let’s stick to a cube. The figure below shows a wireframe cube with 8 corners marked with numbers. Each corner represents a vertex. Assuming that the cube sits at the midpoint of an X-Y-Z axis, such that the middle of the cube runs through the 0,0,0 point, and the cube is a unit cube (a cube with a side of one), we can give each of our vertex coordinates like so:


![](https://paper-attachments.dropbox.com/s_46AA37F21548B85905850A2B37486B7C1120DBCB41BFCD65ED229B927ECE2CEC_1575343580300_cube.png)


In ThreeJS this corresponds to this in code:

```js
const geometry = new THREE.Geometry();
geometry.vertices.push(
  new THREE.Vector3(-1, -1,  1),  // 0
  new THREE.Vector3( 1, -1,  1),  // 1
  new THREE.Vector3(-1,  1,  1),  // 2
  new THREE.Vector3( 1,  1,  1),  // 3
  new THREE.Vector3(-1, -1, -1),  // 4
  new THREE.Vector3( 1, -1, -1),  // 5
  new THREE.Vector3(-1,  1, -1),  // 6
  new THREE.Vector3( 1,  1, -1),  // 7
);
```

With vertices created we can now move on to creating the faces of our cube. As we saw earlier with our 2D square, computers draw shapes in a very specific manner. This means that the order of the vertices we’ll be using to draw the faces of the cube matter. In general, the order is specified in a counter clockwise direction; I’ve yet to figure out why this is but for now let’s take that at face value. Here’s an example of how we’ll split up the faces of the cube into triangles. Essentially every face is split into 2 triangles, with a very specific order in which the triangle is drawn (remember counter clockwise). 

Let’s start by defining the front face of the cube. We’ll start from 0 and draw triangles in a counter clockwise direction, so we’ll go 0 → 3 → 2 and then 0 → 1 → 3. Easy right? lol. [This article](https://threejsfundamentals.org/threejs/lessons/threejs-custom-geometry.html) explains in greater detail. It took me a while to get it so if it’s confusing don’t fuss, it’ll take a bit. In addition to the front face we’ll also have to define all the other faces of the cube. It essentially goes front → right → back → left → top → bottom. 


![](https://paper-attachments.dropbox.com/s_46AA37F21548B85905850A2B37486B7C1120DBCB41BFCD65ED229B927ECE2CEC_1575342630547_3dwire.png)


You’ll end up with code that looks like this:

```js
geometry.faces.push(
  // front
  new THREE.Face3(0, 3, 2),
  new THREE.Face3(0, 1, 3),
  // right
  new THREE.Face3(1, 7, 3),
  new THREE.Face3(1, 5, 7),
  // back
  new THREE.Face3(5, 6, 7),
  new THREE.Face3(5, 4, 6),
  // left
  new THREE.Face3(4, 2, 6),
  new THREE.Face3(4, 0, 2),
  // top
  new THREE.Face3(2, 7, 6),
  new THREE.Face3(2, 3, 7),
  // bottom
  new THREE.Face3(4, 1, 0),
  new THREE.Face3(4, 5, 1),
);
```

If you’re having trouble wrapping your mind around how counterclockwise triangles work in 3D, here’s a handy diagram of a deconstructed 3D cube for reference. 


![](https://paper-attachments.dropbox.com/s_46AA37F21548B85905850A2B37486B7C1120DBCB41BFCD65ED229B927ECE2CEC_1575342639510_3dunfolded.png)


With the cube created, let’s pop that into a mesh and add some camera and lights and walah, a working 3D cube! https://codepen.io/shortdiv/pen/zYxYmJv?editors=1010

Hope this helps demystify some of the 3D geometry weirdness. Feel free to play around with this codepen and change up the values of the vertices to see how that changes the shape of the cube. 


