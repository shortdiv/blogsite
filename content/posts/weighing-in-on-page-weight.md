---
title: "Weighing in on Page Weight"
description: ""
tags: [performance, advent, frontend]
categories: [performance, advent, frontend]
date: 2018-12-01T21:38:21-06:00
draft: false
---

# Weighing in on page weight.

Early on in my career, when web performance metrics were brought up in conversation, I would take how others reacted to the number as a cue to understanding what those numbers meant (read: I had no idea what those numbers meant). A high number elicited shock and horror, while a low number drew admiration and praise. This could only mean, high page weight bad, low page weight good. Though my naïveté around web performance at the time was a result of my overall lack of experience, it did highlight a point worth considering; the concept of a “page weight” is somewhat of a confusing term especially when seen in isolation.

Weight is ubiquitous with something tangible that can be consistently marked by a unit of measurement. Often when we talk about weight, we talk about mass. Something weighing a tonne means it occupies a lot of mass for example. In the realm of software however, because we’re dealing with digital information in the form of bits and bytes rather than physical objects mass is zero. The reference to “weight” therefore is a misnomer (similar to how serverless is a misnomer for just not your server). Therefore, when we refer to “weight” in web performance, what we really mean is page load, or the speed by which the bytes of a webpage is transferred across a network.

## Quick Maths

For a better sense of what those numbers in web performance metrics mean, here’s a byte conversion table for reference. With the number 1024 in your back pocket and some fast mental arithmetic, you’re already on your way to being a web performance whiz.

| **1024 bytes** | **1 KB** |
| -------------- | -------- |
| **1024 KB**    | **1 MB** |
| **1024 MB**    | **1 GB** |
| **1024 GB**    | **1 TB** |
| **1024 TB**    | **1 PB** |

## Why should I care?

The web is increasingly being accessed by mobile devices. [According to a Cisco whitepaper](https://www.cisco.com/c/en/us/solutions/collateral/service-provider/visual-networking-index-vni/mobile-white-paper-c11-520862.html), global mobile data traffic is projected to increase sevenfold between 2016 and 2021 such that it will be representative of 20 percent of _all_ web traffic. While it may seem that mobile network providers are clamoring to increase network speeds, low speed mobile connections is the norm for a vast majority of mobile users worldwide. A “heavier” website, therefore means that data takes longer to transfer across the network resulting in slow page load times. You can think of this process like the movement of sand in an hourglass. A smaller neck width (i.e. slower network, think 2G) means the sand takes longer to trickle down compared to a larger neck width. This slow trickle of data across the network correlates with a poor user experience, which eventually translates to people leaving your website even before it fully loads.

If that is not evidence enough to why we should care about performance, then consider the fact that there is no such thing as free bandwidth. Loading a web page onto a device requires bandwidth, which translates to a direct, very tangible cost to users. Even with “unlimited” data plans, your network is often throttled upon reaching a certain bandwidth of usage. As a result, similar to the above scenario people will inevitably leave and never visit your website again.

![Device Atlas stats on page load times across different countries](https://deviceatlas.com/sites/deviceatlas.com/files/images/time_worked_to_view_average_site.png)

## But really though, does it matter?

So by now we all agree and understand that slow websites are terrible. But is page weight meaningful as a measurement of performance? Sort of. It’s undeniable at this point that page bloat directly affects mobile users who have to deal with data caps and network latency.
However, if you’re focused largely on perceived performance, or the general user experience of a website, then page weight doesn’t really matter. You can have heavy webpages that still feel lightning fast. Instead, when considering user-perceived performance, [a better metric](https://www.stevesouders.com/blog/2013/05/13/moving-beyond-window-onload/) should probably take into account rendering, or specifically when above-the-fold content has loaded.
One way or another, it’s still beneficial overall to have a low page weight.

## Always Budget for Performance

When it comes to matters of performance, it can feel like a constant compromise between design and overall functionality; A constantly running video loop in the background might look cool but it could also mean a heavier page load. A good starting point when thinking about performance is setting yourself a budget much like you would when handling your own finances. [More specifically, a web performance budget is a set of limits to values, such as image sizes, HTTP requests etc that affect site performance that cannot and should not be exceeded](https://www.keycdn.com/blog/web-performance-budget). There are a plethora of tools to calculate web performance budgets, including SpeedCurve and http://www.performancebudget.io/.

## The Weight is not always worth the wait.

Weight is an important factor to consider when weighing the speed and impact (via bounce rates etc) of a webpage. However, its a fairly superficial metric that only gives you information on one aspect of your webpage. For instance, a lightweight webpage, while fast to load, doesn’t always equate to a delightful user experience. As Tammy Everts put so simply in her article “**The average web page is 3MB. How much should we care?”,** Correlating page size with user experience is like presenting someone with an entire buffet dinner and assuming that it represents what they actually ate. A better way of thinking about the performance of your websites is from the point of view of a user. Indubitably, performance matters. Even so, a page with fun animations and videos tend to draw users. Ultimately, you have to make the right judgement call when it comes to how to keep your pages lightweight without sacrificing overall user experience.
