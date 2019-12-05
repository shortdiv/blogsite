---
title: "Back to Primitives"
description: ""
tags: [advent, frontend, threejs]
categories: []
date: 2019-12-04T21:40:17-06:00
draft: false
---

Geometry is the basis for drawing any shape in ThreeJS. As I covered in earlier posts, geometry in ThreeJS consists of vertices and faces, which can be defined by hand in order to create custom geometry. Of course, this task of defining your own vertices and faces is ambitious and requires a firm understanding of how math works in ThreeJS—knowledge which I currently do not have. To keep things simple, ThreeJS offers default 3D shapes known as primitives so you don’t have to grok geometry to generate common shapes like spheres and cubes. 


## All of the shapes

ThreeJS offers many options when it comes to default shapes, here are a couple of common ones that I find particularly easy to work with and understand:

Cubes [Boxes]
Cubes are probably one of the most quintessential examples when starting out with 3D. Because all sides are equal, there isn’t much complication when it comes to figuring out the parameters you’ll need to configure them in ThreeJS. Here’s a basic example of setting up the geometry for cubes: 

```js
const width = 1;
const height = 1;
const depth = 1;
const geometry = new THREE.BoxBufferGeometry(width, height, depth);
```

### Spheres
Spheres are where the geometry of ThreeJS starts a become a little more complex. As I highlighted in a previous post on curves, computers find it hard, if not impossible to get curves perfectly smooth. Spheres are therefore not perfectly round and instead consist of other more angled shapes like triangles; the parameters for height segment and width segment determine how many triangles you see on the sphere along its height and width respectively. The code for that looks something like the snippet below. As you can imagine increasing the `heightSegment` and `widthSegment` will make for a smoother sphere.

```js
const radius = 5;
const heightSegment = 32;
const widthSegment = 32;
var geometry = new THREE.SphereGeometry( 5, 32, 32 );
```

### Cylinders
Cylinders are another common type of shape that can come in handy when creating composite geometries like trees. To create a cylinder, you have to define the radius of both the top and bottom faces, the height of the cylinder as well as how many segmented faces the cylinder will have around its circumference. You also have the option of defining the other properties like the height segments, whether or not the cylinder is open ended and the angle of segments. 

```js
const radiusTop = 4;
const radiusBottom = 4;
const height = 8;
const radialSegments = 12;
const geometry = new THREE.CylinderBufferGeometry(radiusTop, radiusBottomheight, radialSegments);
```

### Cones
Cones are another frequent shape offered in ThreeJS. Much like cylinders, they take in a radius (except only for the bottom face, since cylinders have one flat bottom face), a height and radial segment, as well as an option to be open ended. 

```js
const radius = 5;
const height = 20;
const heightSegment = 32
var geometry = new THREE.ConeGeometry(radius, height, heightSegment);
```

## The two geometries; BufferGeometry and Geometry

When working with geometries, a common confusion tends to be around whether to use `Geometry` over `BufferGeometry`. The defining difference between the two has to do with performance. `BufferGeometry` is specifically geared for performance. Vertices generated via this geometry type are generated directly into an efficient typed array format and are set for optimal rendering by the GPU. This optimization leads to faster start up time though it comes at the cost of flexibility. Because of the optimizations done to data in `BufferGeometry`, modifying and updating data becomes slightly more complex. Compared to `BufferGeometry`, `Geometry` is a little easier to manipulate though slightly more memory intense since ThreeJS has to convert them to an efficient binary representation before rendering it on the GPU. Here’s a side by side comparison of how `BufferGeometry` and `Geometry` are used.

```js
var geometry = new THREE.Geometry()
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

var geometry = new THREE.BufferGeometry();
var vertices = new Float32Array([
  -1, -1,  1,  // 0
  1, -1,  1,  // 1
  -1,  1,  1,  // 2
  1,  1,  1,  // 3
  -1, -1, -1,  // 4
  1, -1, -1,  // 5
  -1,  1, -1,  // 6
  1,  1, -1  // 7
]);
```
That’s all for now, more tomorrow! 
