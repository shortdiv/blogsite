---
title: "A Cube in 3d"
description: ""
tags: [advent, frontend, threejs]
categories: []
date: 2019-12-01T22:50:16-06:00
draft: false
---

Because we’re starting from the basics, this week we’ll focus largely on shapes and rendering shapes to the screen. This task may seem trivial but I assure you there’s a lot happening to occupy a week’s worth of content. To keep things simple, we’ll create our 3D images using ThreeJS, a JS library that abstracts a lot of the complexities of WebGL so you can write graphics with the power of JavaScript! 


## The Basics 

When working with ThreeJS there are some basic concepts to grok which conveniently correspond to the main classes you invoke when creating projects in ThreeJS. These are a Scene, Renderer, Camera, Light and an Object (these consist of Geometry, Material and Mesh). 

### Scene
The scene is the literal stage upon which the 3D world is set and will therefore include lights, camera and any objects in the scene itself. 

### Renderer
The renderer is is an object that creates the image onto the screen. In ThreeJS, the renderer is responsible for drawing the image to a `<canvas>` element. 

### Camera 
The camera is an object representing a viewpoint from which an image is being observed.

### Light
Light brightens the space and creates a sense of depth so the 3D quality of an image is perceptible.


## Setting the Stage

To better grasp what’s going on in ThreeJS and the interplay of the above concepts when creating a 3D graphic, let’s create our first scene. To do this, we’ll start by invoking the scene method on a new ThreeJS instance. 

```js
var scene = new THREE.Scene();
```

Next, we’ll need to set up the camera so we can see what’s happening. There are two possible cameras you can use in ThreeJS, one uses orthographic projection and the other uses perspective projection. In most instances, we’ll be using the perspective camera, this makes an object appear small from far away and larger when close up. Technically speaking, the perspective camera defines a frustrum, which is just a solid pyramid with its tip cut off.

A PerspectiveCamera is defined by 4 main properties, which the camera method accepts as arguments; these properties are field of vision, aspect ratio, near and far respectively. `near` defines where the front of the frustum starts, `far` defines where it ends, `fov`, or field of view, defines how tall the front and back of the frustum are by computing the correct height to get the specified field of view at near units from the camera and `aspect` defines how wide the front and back of the frustum are. The width of the frustum is just the height multiplied by the aspect. Check out the figure below for a visual representation of what these mean.  


![https://threejsfundamentals.org/threejs/lessons/threejs-cameras.html](https://paper-attachments.dropbox.com/s_3B32E6C30BE2B1F6D97AFD07C3EEF20655470EEF37B2AF717F77891720D894C5_1575260719756_image.png)


```js
var camera = new THREE.PerspectiveCamera(
  75, // field of vision
  window.innerWidth / window.innerHeight, // aspect
  0.1, //near
  1000 // far
);
```

With the camera set up, the last step for the scene creation is to set up the renderer and define the size of the screen.

```js
var renderer = new THREE.WebGLRenderer();
renderer.setSize( window.innerWidth, window.innerHeight );
document.body.appendChild( renderer.domElement );
```

So far, we’ve gotten a scene but we shouldn’t see much on the screen. That’s because there are no objects in the scene just yet. Let’s change this and add our first object, a cube.

## Enter Cube

Creating a cube requires some basic geometry to draw the skeleton of the cube and a material to create a skin for our cube. As with most of ThreeJS, you have lots of options when it comes to picking the geometry to use for our cube. We’ll stick with `BoxGeometry` for now and delve into why in a separate post. 

```js
var geometry = new THREE.BoxGeometry(1, 1, 1)
```

With a basic geometry created, we can then move on to adding a skin to the cube. Again, we have many materials to choose from but we’ll stick with the `MeshBasicMaterial` for now and pass in a color in hexadecimal form. 

```js
var material = new THREE.MeshBasicMaterial({color: 0x00ff00});
```

Now that we’ve defined how we want our cube to look, we’ll have to create a cube by creating a mesh and then adding that to our scene. 

```js
var cube = new THREE.Mesh( geometry, material );
scene.add( cube );
```

As is, we shouldn’t see our cube because we haven’t positioned it on the scene. Let’s move our cube into view. 

```js
cube.position.z = -5;
cube.rotation.x = 10;
cube.rotation.y = 5;
```

And finally let’s render our cube to the screen.

```js
renderer.render(scene,camera);
```

## Play On
This is probably really obvious but what we have so far accomplished is just the tip of the iceberg when it comes to what's possible with Threejs. But one cube rendered onto a screen is progress and I look forward to more tomorrow! 
