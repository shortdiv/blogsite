---
title: "The (not so) secret life of service workers"
description: ""
tags: [performance, advent, frontend]
categories: [performance, advent, frontend]
date: 2018-12-11T18:58:05-06:00
draft: false
---

Service workers are an important player in the PWA game. Not only are they handy for keeping applications functional while offline, they are also instrumental when it comes to improving overall page load time. Working with a service worker however can be a little tricky. Because they are run in the background of a page (outside of a page’s render cycle) and are registered only once, service workers don’t always work as expected. Contrary to how we normally build and debug for the web, service workers don’t update when the file is updated and the page is refreshed. Depending on your use case, reflecting changes made to a service worker may require either closing the browser tab, refreshing the page or navigating to another page. The reason for this behavior is that the service workers are bound to a specific lifecycle that predetermines whether and how they gain control of the document. The lifecycle of a service worker can be one of the most confusing if not frustrating aspects of working with a service worker. Even so, understanding this lifecycle is the key to unlocking the possibilities that service workers provide.

## Service Worker: Welcome to my life(cycle)

In the life of a service worker, there are many stages that it undergoes from “birth” to “death”; Birth refers to when a service worker first takes control of a page and death refers to when it loses control of a page. Here’s a diagram from an O’Reilly book on _Building Progressive Web Apps_ to give you a visual of the general lifecycle of a service worker.

![https://www.oreilly.com/library/view/building-progressive-web/9781491961643/assets/bpwa_0403.png](https://www.oreilly.com/library/view/building-progressive-web/9781491961643/assets/bpwa_0403.png)

### Installing

In the “Installing” stage, the browser engine attempts to register a service worker by downloading the relevant service worker file and parsing it (as it would any other JS file). This step happens when you `navigator.serviceWorker.register` gets called. In the midst of installing, the service worker script is executed thereby setting in motion any tasks that the service worker prescribes. This is usually where data and static files get cached. Since the success of a service worker depends on the successful operation of certain tasks, files being cached for example, the installation of a service worker needs to be prolonged until after these tasks are complete. This is done via the `waitUntil` event, which accepts a promise and only completes once the promise is resolved. Here’s a code snippet of a service worker script courtesy of MDN to illustrate this process better:

    self.addEventListener('install', function(event) {
      event.waitUntil(
        caches.open('v1').then(function(cache) {
          return cache.addAll([
            '/my-file/index.html',
            '/my-folder/styles/main.css',
            '/my-folder/js/main.js'
            '/sw-test/images/thing.jpg',
          ]);
        })
      );
    });

### Installed

In the event of a successful installation, the service worker moves to the “Installed” stage. At this stage, the newly installed service worker is on deck and ready to go. Assuming there are no currently active service workers on the page, the installed service worker will gain immediate access to the page and move on to the activating stage. If however, there is another active service worker, the newly installed service worker remains waiting until the currently active service worker dies/is removed. To use the new service worker in place of the old one, you would have to either refresh the page or close+re-open the page.

### Activating

Right before a service worker becomes fully operational, it receives an `activate` event. The main purpose of this stage is to run any necessary cleanup of resources used in previous service workers. This includes getting rid of old files and any additional management of the application cache. Similar to the earlier `installing` event, `activating` can also be prolonged via a `waitUntil` event to ensure tasks are complete before a service worker is “deployed”. The success and failure of any promises contained in waitUntil will determine whether or not a service worker is activated. Here’s what that looks like, courtesy of the [Google Docs](https://developers.google.com/web/fundamentals/primers/service-workers/):

    self.addEventListener('activate', function(event) {
      event.waitUntil(
        caches.keys().then(function(cacheNames) {
          return Promise.all(
            cacheNames.map(function(cacheName) {
              if (cacheWhitelist.indexOf(cacheName) === -1) {
                return caches.delete(cacheName);
              }
            })
          );
        })
      );
    });

### Activated

When the activation step is successful, a service worker is now active and in fill control of a page. In this stage, the service worker can run events like `fetch` to send and receive data from a server that it will then cache for a future offline event. This stage and the previous one are most relevant to updated service workers. An otherwise “new” service worker would have already been active in the “Installed” stage.

### Redundant

If a service worker failed at any of the above stages or becomes replaced by an updated worker, it is considered “redundant”. In this stage, the service worker is considered “dead” and no longer has control of the application.

## `clients.Claim`**: The Magic Elixir of Life**

While service workers are more or less bound to the above mentioned lifecycle, there are methods to bypass certain stages to force a service worker to take control of a page. One of these methods is `clients.claim()`. The claim method allows an **_active_** service worker to set itself as the controller for all clients within its scope. This means that every active page within the scope of the previous service worker will become controlled by the new service worker effectively forcing a refresh event. While this may seem like the magic elixir for enabling a service worker, this method should be used with caution since it disrupt user experience.

## Service Workers are alive and well and living in PWAs

A common misconception of service workers is that they are always running. If you think about it, an always running service worker would actually be a performance drain rather than a performance gain, especially with an increasing number of sites using them. Instead a service worker is—again to use Jeremy Keith’s metaphor yet again—“a patient spider that lies in wait”. Rather than being proactive, a service worker is reactive, it responds to events being triggered and handles them appropriately. All in all, service workers (when used well) are incredibly powerful tools to building successful offline experiences. So use them wisely.
