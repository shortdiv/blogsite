---
title: "Errwhere PWA; bridging the mobile and desktop experience"
description: ""
tags: [pwa, advent, frontend]
categories: [pwa, advent, frontend]
date: 2018-12-13T18:20:20-06:00
draft: false
---

In the latest stable build of Chrome, came support for desktop progressive web apps (PWAs). Similar to mobile PWAs, desktop PWAs allow users to install apps onto a device’s home screen for quick and easy access. In addition to this, they allow web apps leverage to the numerous capabilities of modern web APIs like authentication, payments and so on, without having to worry about potential security vulnerabilities. After all, a desktop PWA is basically a web browser running in its own app window context.

## Why Desktop? Isn’t PWA for mobile?

The development of Progressive Web Apps and features that support them (i.e. service workers, background sync API) are largely driven by the desire to enhance the mobile experience. This makes sense, considering that mobile usage has sky rocketed over the last decade and has become the primary means by which the majority of people interact online. This rapid growth, however is not exclusive to the mobile web and can be seen in the desktop web as well, albeit at a slightly slower rate (see chart below).

![](https://d2mxuefqeaa7sj.cloudfront.net/s_F69EE29B534392C1E193E94655E10D976EA13FCAE9EA2A8E88B5BC75DEA79DCC_1544741470440_Screen+Shot+2018-12-13+at+4.50.39+PM.png)

In addition to the growth of desktop usage that closely follows that of mobile usage, it is also worth noting that users often switch between mobile and desktop and use either based on context. For one, a user may use their laptop or desktop for the bulk of their workday and intermittently use their phone throughout the day. With this constant switching from laptop to phone, comes the general expectation that apps should look and feel the same across their devices.

## What about Electron?

If your first thought on reading this was, but doesn’t Electron already do that? You’re right…in a sense. Electron was introduced by GitHub back in 2013, and was a node-based runtime that enabled developers to build cross platform applications using nothing more than HTML, CSS and JavaScript. This was revolutionary at the time, because the barrier to entry for creating desktop application then was [too damn high](https://giphy.com/search/too-damn-high).

Despite the success that Electron brought to the desktop application development landscape, Electron is far from performant. The magical ‘renderer’ process that electron uses to run code for the desktop depends on the browser run time. As a result, every electron app ships with a copy of both Node.js and Chromium—A basic hello world electron application weighs in at nearly 40 MB zipped. This situation is worsened by the various executables and installers generated from each build and update that significantly adds to overall page weight.

## Better desktop apps, with PWA

Without a doubt, Electron was instrumental in paving the way for making desktop development easier. Despite its performance pitfalls, the success of Electron continues to this day with companies like Slack (Slack), and Microsoft (VSCode) using Electron as the basis for their applications. The introduction of PWAs for desktop however brings with it a new era, where developers don’t have to compromise performance when building for desktop. At the moment, desktop PWAs are very much in the early stages of development with support only for [Chrome OS, Linux and Windows](https://developers.google.com/web/progressive-web-apps/desktop). Moreover, the overall PWA desktop experience has yet to be fully immersive with ongoing development being made to support badging, and keyboard shortcuts. Nevertheless, desktop PWAs is an exciting new development that should reinvigorate the experience of building for desktop while enabling a better cross platform experience for all.
