---
title: "Through the (Magic) Window"
description: ""
tags: [future, advent, frontend]
categories: [future, advent, frontend]
date: 2018-12-23T10:49:36-06:00
draft: false
---

In the last few years, virtual reality (VR) and augmented reality (AR), also known as cross reality or XR, have developed far beyond the niche realms of the gaming industry. There are now compelling use cases for using XR for building applications focused on education (Aurasma, Math Alive), home improvement (Wayfair, Ikea Place) and even beauty (Meitu) that are accessible to the masses. Despite its growth in popularity, many XR applications today often require the installation of a separate mobile application. Snapchat lenses, and Instagram face filters for instance require using these applications to get the full XR experience. The reason developers lean on mobile when building XR is largely because mobile gives them more fine tuned control of native input controls compared to the web. To address this current handicap and to better bridge the gap between the virtual world and the web, browser vendors have teamed up to work on a XR focused web API termed WebXR.

## The origin story

The recent introduction of the WebXR API was not the first time that browser vendors had talked about building an API to support immersive experiences. In fact, WebXR is predated by an earlier API of a similar name—WebVR. This older WebVR API saw two minor releases, 1.0 and 1.1 and shared WebXR’s goal of making immersive (specifically virtual reality) experiences accessible on the web via a URL. WebVR, as the name indicates however, only accounted and optimized for virtual reality experiences, so users could view VR content without a headset via “Magic Windows”, which were monoscopic views of 360º content embedded in a canvas element. Moreover, early iterations of WebVR were tied to the JavaScript thread, and posed many performance challenges (among many others). As a result of this, the lessons learned in implementing WebVR was adapted to create a new API that focused on a simpler implementation, greater performance improvements and a complete immersive experience. This would include VR, AR and Mixed Reality (MR)—for more on the specificities of what those terms mean and how they differ, check out [this post](https://beebom.com/what-is-mixed-reality/).

## Start Here

Though WebXR aims to make immersive experiences accessible to web browsers, building for XR is incredibly dissimilar than building web applications that many of us are probably already familiar with. An obvious difference between the two is dimensionality. The 3D web breaks the allegorical fourth wall of the 2D web by allowing developers to enhance the depth and tangibility of applications so they can in a sense bring them to life.

“The best VR and AR efforts add to or enhance pre-existing behaviors.” — InvisionApp team

### IRL, make it a better experience

Since XR augments reality, a good place to start when thinking about building for XR is to think about how we currently interact with the world and how XR could improve it. An immediate example that comes to mind is a live map that adds additional indicators for buildings and train stations to get a better “lay of the land” while navigating.

### Hold their hand

Immersive experiences are by nature non-linear and non-narrative. This means that the general experience will never be the same regardless of how you intend the experience to be. For applications where you’re literally just putting an object or a person ([hi, spiderman](http://intothespiderverse-ar.com)) in a room, this may not be as relevant. When using XR to construct a narrative, however, you’ll notice that no matter how hard you try every experience will always be unique. Developers therefore run the risk of confusing or throwing users completely off the story arc if experiences are not in sync with the current environment. To prevent this from happening, it’s therefore important to only reach for XR to build upon a story and add to the overall experience instead of relying on it to tell the story for you. In addition, while we want users to explore the application independently, it’s also key to offer guidance and help along the way so they don’t get completely lost or worse, frustrated.

### Design for the medium

Being accustomed to the 2D web platform, it can almost be natural to directly port design principles when building for XR. While this can be a good start for making the switch between the two, it doesn’t take advantage of the full capacities that XR provides. To fully optimize for an AR experience, it’s important to consider the famous phrase “The Medium is the Message”. Instead of thinking of XR experiences as a means of presenting content in a different format, you can utilize it to uncover new possibilities of interacting with the real world. An example of this may be a 3D furniture item that exposes a static price tag that you can click on to navigate to a webpage to complete a purchase. The nice thing here about building for XR is that they are “immersive” and can add to existing web experiences, so build on that.

## Through the wall. (Conclusion)

WebXR is an exciting new development that opens up new possibilities for how we can interact with the web. While the API is still in active development, and may very well change drastically in the near future, go check out [the spec for it](https://github.com/immersive-web/webxr), and [this awesome blog post](https://blog.tojicode.com/2018/02/early-access-to-webxr-device-api-in.html) highlighting what’s to come and I promise you will not be disappointed.

![Procrastinating while writing this post](https://d2mxuefqeaa7sj.cloudfront.net/s_700A33855C9804F7AAAA6812F5F53171611A420A584E7C10598F56DADD4165DF_1545583697422_image.png)
