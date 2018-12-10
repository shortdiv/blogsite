---
title: "At Your Service Worker"
description: ""
tags: [performance, advent, frontend]
categories: [performance, advent, frontend]
date: 2018-12-09T20:43:10-06:00
draft: false
---

Network connectivity is a single point of failure when it comes to user experience on the web. By nature of the web’s reliance on the network, the web fails when the network b0rks. Inadvertently as developers, this means that we’re always at the mercy of network connectivity. When faced with a slow or failed network connection, there is no way for us to help websites gracefully fail. While connectivity is an issue for most mobile web applications because of the reliance on the network, native mobile apps are able to deliver an offline user experience that is on par with an online one. This is largely because native mobile apps are built on the premise of “offline first”, where users are sent cached resources even before the app makes a connection to the server.

Historically, enabling a seamless offline experience has been a unique feature of mobile apps. When a user downloads a mobile app, they’re downloading critical assets and resources that the app then uses on initial boot thereby significantly reducing the time to first render. With the introduction of service workers however, the web now has a way to continue working even when the network is not consistent.

## What are Service workers really?

Simply put, service workers are scripts that run in the background of a user’s browser and that run separately from the main browser thread. Because service workers are kept separate from the main work of the browser, they can intercept network requests, and cache or retrieve resources from the cache without in any way being impacted by the browser’s connection to the server. Service workers thereby give developers the power to not only fail gracefully when a web app is kicked offline but to also create mobile-like experiences by enabling features such as push notifications and background synchronization.

If service workers are still confusing to you, Jeremy Keith’s diagram illustrating the part service workers play in the grand scheme of a web request might give you a better visual representation of this.

![https://adactio.com/images/articles/introducingserviceworkers/fig-1.2.png](https://adactio.com/images/articles/introducingserviceworkers/fig-1.2.png)

## But wait, what about appcache?

If you’ve poked around for solutions on handling offline experiences for the web, you may have come across the concept of the [application cache](https://www.html5rocks.com/en/tutorials/appcache/beginner/) (or appcache as the cool kids say it). Appcache is essentially a way for the developer to specify which files the browser should cache and make available offline. This is done via a cache manifest file, which is a simple text file listing the resources the browser should cache for offline access. The problem with appcache (and the reason we have service workers) is that appcache can be incredibly finicky and confusing to implement. For one, appcache always assumed a user was offline even before a connection managed to time out. This meant that users were always served the cached version of a webpage and had to be nudged to refresh the page in order to get any relevant updates. Moreover, handling subsequent updates to the appcache required significant wrangling. For more on why “Appcache is a Douchebag”, [check out this excellent post](https://alistapart.com/article/application-cache-is-a-douchebag) by Jake Archibald enumerating the numerous gotchas and workarounds when finagling appcache.

## Soooo….are they kind of like Web Workers?

If you were to categorize them, service workers are a type of web worker. Similar to a web worker—a web worker is an API for spawning scripts in the background of your app to handle tasks without blocking the UI rendering thread—a service worker runs its own global context by virtue of running on a separate thread. Since it runs independent of the main UI thread, it is neither tied to a particular page nor has DOM access. This is where service workers start to diverge from web workers. While a web worker doesn’t require direct access to the DOM, it requires a page to run. Comparatively, a service worker can run without any access to a page. Additionally, unlike a web worker, a service worker is event-driven and can be terminated and restarted without instruction.

## All hail the service worker, the BDFL of the web

Overall service workers have a lot more control over an application compared to web workers. Once installed on a machine, they have full read/write access to a webpage. They can easily swap out content on a specific domain and collect valuable data like a user’s credit card information, and address. As Jeremy Keith likes to describe them, a service worker “lies in wait, like a patient spider waiting to feel the vibrations of a particular thread.” Because of this potential security vulnerability that service workers bring, they require HTTPS. Once you have HTTPS enabled, you have full access to the service worker API and start writing your own service workers to optimize your applications for offline mode!
