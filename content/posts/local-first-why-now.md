---
title: "Local-first, why now?"
description: ""
tags: [advent, local-first]
categories: []
date: 2025-12-03T23:33:11-05:00
draft: false
---

The rise of the local-first movement was no anomaly. For years, browsers were no match for native environments that offered superior performance and offline capabilities. The gap was painfully obvious, native apps could store gigabytes of data and had access to a whole file system while browsers barely scraped by with megabytes. Modern browsers have since caught up over the last few years and the divide between browser and native environments has significantly blurred. There were many developments that gave rise to this, chief among which are: larger browser storage capacity, and new storage APIs. Let’s examine these. 

Early web storage primitives like cookies and localStorage were limited to ~4KB per cookie and 5-10MB per origin respectively. And early iterations of IndexedDB capped storage between 5 and 50MB on a good day. Back then, browser storage was primarily seen as temporary cache and apps were built with a fairly thin client. As apps grew and the ecosystem around it changed, web apps pushed the limits of client side capabilities forcing browsers to support more complex interactions. For instance, the advent of google docs required reliable offline storage and sync functionality to be lucrative as a product. As a result, client-side capabilities transformed. Today, browsers support robust storage, ranging from hundreds of megabytes to multiple gigabytes, enabling complex, feature-rich web applications.

With more complex apps, came higher expectations of what a web app could do. The introduction of Electron around 2013 in the form of the atom text editor revolutionized the way we built desktop-quality applications using web technologies, further blurring the line between web and native apps. This shift not only expanded our imagination of how to build for the web but inspired innovation in the browser storage ecosystem. One result was Origin Private File System (OPFS), which enables near-native file I/O directly within browsers. This means apps that were once constrained by storage and performance limits are now richer, more responsive and work seamlessly offline. Paired with a WebAssembly (WASM), this provides low level primitives so we can now embed more robust database engines like sqlite directly in the browser. 

In short, advancements to browser storage capabilities and APIs were a big driver to making the local-first movement possible. Browsers now have the tools—OPFS, WebAssembly, and IndexedDB—to handle robust, offline-first applications. Now on to just making local-first happen. 
