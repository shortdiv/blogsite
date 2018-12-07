---
title: "Http2; the Magic Elixir of Performance"
description: "Though we as developers can influence how the browser downloads resources, the browser ultimately gets the last say when it comes to the order in which to load content. In this post, we dive into the new and exciting features that HTTP/2 brings."
tags: [performance, advent, frontend]
categories: [performance, advent, frontend]
date: 2018-12-06T22:51:36-06:00
draft: false
---

This week, we focused on web performance and discussed the many strategies to improving our websites to optimize for a fast user experience. Some of these strategies involved “forcing the browsers hand” or coercing it into downloading resources in a specified order and time—hello preload and async/defer. Historically, the browser exercised full control over how and when resources were downloaded in order to paint pixels to the screen. It would make requests as they came, one at a time and block rendering while it waited on resources it needed from the server. This was the norm under the HTTP/1.x protocol. With HTTP/2 however, the developer now has the capacity to influence the order and priority in which the browser loads content. In addition, we can now request multiple resources in parallel without the unnecessary overhead and complexity of establishing multiple connections (more in this later!).

In order to best understand the benefits HTTP/2 brings to the fore, lets look at what the web was like before and how we optimized websites with HTTP/1.x.

## Blast from the past.

When a browser first loads a webpage, it sends requests for additional resources, such as CSS, JS, and any media files that are needed for building the page. As we discussed in a previous post on the critical render path, resource requests are generally render blocking, which means that the browser stops rendering and waits on the request to complete before it can move on. In HTTP 1.x, the browser was limited to processing only one request per TCP connection. Browsers circumvented this constraint by using multiple TCP connections to process multiple requests simultaneously. Because individual requests required separate connections to run requests “in parallel”, network congestion was a problem. This is generally bad for users because browsers monopolize the limited network resources and downgrade overall network performance. Making a large number of requests over multiple connections also meant that there was a high chance of duplicate data requests. These constraints led developers at the time to workarounds such as spriting, data inlining, domain sharding and concatenation.

**Spriting**
Though this may seem counterintuitive, in HTTP 1.x retrieving one (giant) image file was more efficient than making separate requests for multiple (smaller) image files. Spriting allowed developers to work around the browser limiting concurrent requests by combining multiple images into a single request.

**Inlining**
Inlining was standard in the HTTP 1.x workflow because it helped improve the overall perceived render time of a page. Instead of having to make a separate request for styles, the browser could immediately start applying styles to the DOM. This is a practice that still holds value today as it helps the browser load critical CSS to reduce initial render time.

**Domain Splitting/Sharding**
In HTTP 1.x, the number of open connections were limited. Developers worked around this by spreading requests for assets across multiple domains. Because of this, the browser could make simultaneous requests via multiple TCP connections, thereby speeding up the page load time. While this brought about huge performance gains in the world of HTTP 1.x, it required quite a bit of initial overhead in terms of setting up the infrastructure to support sharding.

**Concatenation**
To reduce the number of HTTP requests, developers would combine (or concatenate) similar file types into one file. Of all the strategies adopted in the time of HTTP 1.x, concatenation was the most common and easiest to implement. JavaScript and CSS could easily be combined into a single file via build tools such as Grunt and Gulp.

## Chhhhh ch ch changes….

The goal for introducing a new protocol for HTTP centers around the need to make the web more performant and robust. HTTP/2 therefore introduce improved capacities to reduce latency, and enable request prioritization among many others. Below are some of the notable changes that HTTP/2 brings.

**Binary frames**
With HTTP 1.x, requests were text-based, with affordances made (such as whitespace and newlines) for human readability. While the text-based protocol made it useful for us humans when it came to debugging, it was error prone. HTTP/2 uses binary to encapsulate messages transferred between client and server. Compared to text, binary frames are more efficient and easier for the network to generate and parse. To get around the difficulty of parsing binary messages, check out [Rebecca Murphy’s tool](https://github.com/rmurphey/chrome-http2-log-parser) for parsing the output of Chrome's HTTP/2 net-internals and turning it into something more useful.

**Multiplexing**
A notable problem with HTTP 1.x as we saw earlier was latency. In order to receive multiple resources, the browser had to open multiple streams or connections. Not only was this practice inefficient, it was also network intensive. HTTP/2 mitigates this issue via multiplexing, a process in which multiple HTTP streams are sent and received asynchronously over a single TCP connection. It does this by disintegrating a payload into small interleaved binary frames, and reassembling them at the other end. With this feature, queued requests is no longer a problem and we no longer need to rely on optimization strategies such as image spriting and concatenation for performance.

**Server Push**
On initial page request, a browser sequentially makes requests to embedded assets as it encounters them in the HTML. Precious time is wasted waiting on the browser to figure out the resources it needs to render a page. Server push is an exciting (and most talked about) feature in HTTP that allows the server to send additional cacheable resources to the client in anticipation of future requests. This anticipated request pushing saves the browser an additional round trip to the server, thereby reducing overall network latency. Since requests are cheap in the world of HTTP/2, you can reduce page load by only serving critical code that the page needs, thereby saving on initial render time.

## You can't solve everything with magic

HTTP/2 brings with it a world of changes and optimizations that will make building for performance an easier task. Though HTTP/2 is no longer the new kid on the block, it’s going to take some time before all our sites fully take control of the entire gamut of performance optimizations that it brings. Moreover, while HTTP/2 provides many performance improvements, it should not be seen as your sole performance strategy when it comes to improving page speed (sorry, not a magic elixir after all. _womp womp_). [This talk](https://youtu.be/cznVISavm-k) by [Patrick Hamann](https://twitter.com/patrickhamann) at Fastly wonderfully encapsulates this idea that HTTP/2, specifically server push, is not and should not be your sole strategy for performance.
