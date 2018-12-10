---
title: "If it's not online does it exist"
description: ""
tags: [performance, advent, frontend]
categories: [performance, advent, frontend]
date: 2018-12-10T17:45:35-06:00
draft: false
---

Offline storage is the linchpin of progressive enhancement. Under a low or unreliable network connection, the app is not dependent on a successful response from the server to be operational. Instead, it reads and writes data from a local in browser database while in offline mode. There are several ways to serve data offline. Picking the right option for your PWA ultimately depends on the type of data you’re intending to store and how big it is.

“For **URL addressable resources**, use the [**Cache API**](https://davidwalsh.name/cache) (part of [Service Worker](https://developers.google.com/web/fundamentals/primers/service-worker/)). For all other data, use **IndexedDB** (with a [Promises](http://www.html5rocks.com/en/tutorials/es6/promises/) wrapper).” — Google

## LocalStorage (Doesn’t work with Service Workers)

One of the simplest way of storing data locally is via `localStorage`. While analogous with `sessionStorage`, `localStorage` is persistent across sessions and don’t expire. Compared to other storage solutions available (see below), `localStorage` presents a lightweight solution with a straightforward API to storing data through key-value pairs. In spite of this however, `localStorage` cannot be used inside a service worker due to it being synchronous by nature i.e. it blocks the DOM. Moreover, though localStorage is a handy solution to offline storage, keep in mind that data is often capped at ~5MB across major browsers and browsers often automagically delete data from local storage when running out of file space.

### WebSQL (Doesn’t work with Service Workers)

WebSQL is an API that provides a fully functional SQL database in the browser. With WebSQL, web applications can store a copy of the application state while offline, and sync back up to the server when the network becomes available again. This therefore allows users to continue working in an app without being booted off when the network becomes unavailable. WebSQL while useful, is currently only [supported by Chrome and Safari](https://caniuse.com/#search=websql) and is soon to be deprecated in favor of IndexedDB. In addition, like `localStorage`, WebSQL does not work well with service workers.

### Cache API

For most PWAs , the Cache API is the de facto way to store assets, especially if they are fairly static—think HTML/CSS/JS files. It was initially developed as a “sidekick” to service workers to enable caching network requests for offline usage but can also be utilized (outside of service workers) as a general storage mechanism should you need one. [Here’s a short article on how to do that](https://developers.google.com/web/fundamentals/instant-and-offline/web-storage/cache-api). Generally, a good rule of thumb for using the Cache API for offline storage in a PWA is to always use it when your resources are URL addressable—think `my-website.com/img/cat.jpg`.

### IndexedDB

In situations when data is consistently updated via a live API or data stream, a static cache like the Cache API is not always useful since data will always be out of date. IndexedDB was designed for this purpose allowing you to store application state in order to speed up application load time. At a basic level, IndexedDB is a low level (read: a little hard to use 😕) API for client-side storage of significant amounts of structured data (Mozilla). Data in an IndexedDB store is indexed via a key. Some good uses of IndexedDB include any application state like data retrieved via an API request as well as user generated content; [either as a temporary store of pre-uploaded data or as a client side cache of remote data](https://developers.google.com/web/fundamentals/instant-and-offline/web-storage/indexeddb-best-practices).

### IndexedDB-like i.e. PouchDB etc

While IndexedDB is a powerful solution to storing application state offline, it is incredibly low level and therefore difficult to use. There are numerous libraries that abstract away the low level API of IndexedDB, to allow developers to interface with IndexedDB without getting mired in its complexity. Pouch DB is an example of this. PouchDB is an API that offers a more intuitive interface and works across browsers to provide an in-browser client side database. As the name sort of suggests (I see you onomatopoeia), PouchDB is modeled after Apache’s CouchDB API. Since Pouch DB is cross-browser, it is able to adapt storage according to what is supported by a specific browser—it uses IndexedDB when supported and falls back to localStorage where appropriate. Compared to IndexedDB, which is event-based, PouchDB is also handy because it is promise-based, thereby allowing you to catch errors without having to build a wrapper around it.

## Offline means Gold; so treasure(chest) it.

An offline-first storage solution is crucial to ensuring your web application is functional even when offline. As discussed above, you have several options when it comes to offline storage. A good starting point when thinking about the most optimal offline storage solution for your use case, be sure to take into account browser support (is it widely supported and/or will it be deprecated?) and whether or not you need your storage solution to play nicely with service workers. Whichever solution you choose, always be aware of its individual caveats and drawbacks to ensure your application works as best as possible while offline.
