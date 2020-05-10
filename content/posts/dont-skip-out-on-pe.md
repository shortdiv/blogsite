---
title: "Don't Skip Out on PE"
description: ""
tags: []
categories: []
date: 2018-12-14T17:20:33-06:00
draft: false
---

This week, I focused on the many aspects of PWAs and their role in making the web experience more streamlined across browsers and devices. Inherent to PWAs is the concept of progressive enhancement. To the untrained eye, progressive enhancement might seem akin to the concept of “it works without JavaScript”. While this is kinda sorta true (a well built PWA should work with JS turned off 🤞🏾), progressive enhancement is more about using web technologies in a so-called “layered” fashion. This technique of building apps makes them adaptable and allows them to run seamlessly regardless of bandwidth, network connectivity or software. In short, Progressive Enhancement is the deliberate strategy of building apps on the foundation of making it usable everywhere.

## Once upon a web app.

If you’ve poked around online, you may have noticed that while PWA is a fairly new-ish concept (hi Frances and Alex!), the term [progressive enhancement](https://en.wikipedia.org/wiki/Progressive_enhancement) is not, and was coined back in 2003. In the early days of the web, and at the advent of the browser wars, web developers were eager to build experiences that were optimized for the most cutting edge browsers. They wanted to do this while also ensuring that older browsers had access to similar content. This strategy of building for the best case and degrading steadily for the worst case, was known as “graceful degradation”. This term was carried over from the engineering world of fault tolerance, which was built on the premise of building systems that would continue to operate even in the event of a partial failure in the system. While graceful degradation was a cromulent and fairly convenient way of building the web, treating backwards compatibility as an afterthought proved more cumbersome than was originally intended. Not only were there numerous edge cases across all the different browsers to consider, there was also the issue of making content accessible.

Progressive enhancement was introduced therefore as the next iteration of [graceful degradation](https://en.wikipedia.org/wiki/Graceful_degradation), and in the hopes of leveling out the playing field so content is truly available and accessible to all. Instead of degrading gradually from top down, progressive enhancement was about building the experience from the ground up—build for older browsers and enhance upwards.

## Building for progressive enhancement

A great analogy for building with progressive enhancement in mind is from Aaron Gustafson who compared a progressively enhanced web app to a peanut M&M. When building apps, start with the content peanut, then move on to the styles (chocolate) and client side scripting (candy shell) respectively and in that order. By building from the lowest common denominator, we are forced to focus on content. JavaScript and CSS therefore becomes more of an embellishment rather than a necessity.

![https://alistapart.com/d/understandingprogressiveenhancement/m-m.jpg](https://alistapart.com/d/understandingprogressiveenhancement/m-m.jpg)

## Winner Winner, Perf got thinner

Though progressive enhancement is focused on streamlining the web experiences, it comes with the added benefit of being good for performance. In my [performance series last week](https://shortdiv.com/tags/performance/), I covered strategies for reducing page weight in order to make our apps run faster. With an ever increasing page load (thanks images and JS), optimization strategies have become crucial to improving performance. If we build apps progressively and offer a baseline of support on which we iterate and enhance, our apps are guaranteed to be performant from the get-go. Because we’re building from the lowest common denominator, our apps no longer have to rely solely on optimization strategies like font loading and image optimization to improve rendering time—They’re an added boost, but our apps don’t rely on them as a performance crutch.

Progressive enhancement moreover complement performance. For instance, you can lean on the power of service workers to turbo boost your existing performance strategies. In a recent blogpost [_“Inlining or Caching? Both Please!”_](https://www.filamentgroup.com/lab/inlining-cache.html)_,_ Scott Jehl illustrated the technique of using service workers to cache inline css. Using this approach, we can use service workers and the new Caches API to load critical CSS so websites are not only blazing fast, but they will also always work offline. 🤯

## Digitally Fit

Developing apps for progressive enhancement is actually simpler than it looks. While the movement focuses a lot on PWAs and the wonders of service workers, progressive enhancement is more an approach than a prescriptive framework. The more we focus on providing users with a consistent, and seamless user experience, the closer we are to making our apps fit for [success](https://medium.com/@AaronGustafson/the-true-cost-of-progressive-enhancement-d395b6502979).
