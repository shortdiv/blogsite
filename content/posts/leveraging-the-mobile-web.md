---
title: "Leveraging the Mobile Web"
description: ""
tags: [performance, advent, frontend]
categories: [performance, advent, frontend]
date: 2018-12-08T18:45:24-06:00
draft: false
---

Last week, we identified the trend that a large and growing number of users are accessing the web via mobile devices. With this trend in mind, we covered various strategies to building websites that load fast and seamlessly without discriminating based on a user’s bandwidth and/or connectivity. From a performance standpoint, lightning fast websites translate to lower bounce rates and an overall more satisfactory user experience. In spite of this, however, the performance of a webpage, no matter how amazing, plays only a partial role when it comes to user engagement. According to a study done by Google comparing the top 1000 native mobile apps vs. top 1000 mobile web apps, it was discovered that while the mobile web saw close to 4 times the number of unique visitors than native apps, the time users spent on the mobile web was only 5% of the time spent on native apps (yikes!).

![](https://cdn-images-1.medium.com/max/1600/0*8rfzRDrCLWrn4u5K.png)

Though performance matters when it comes to building webpages that can reach audiences irregardless of network latency, keeping users engaged require tailor making webpages to match the unique experience that native apps provide. The reason native apps see such high user engagement is likely a result of native apps being better integrated with the operating system. By providing functionality such as [push notifications](http://info.localytics.com/blog/push-messaging-drives-88-more-app-launches-for-users-who-opt-in), a readily available icon on the homescreen for quick access, and automagic app refresh, native apps provide users with a more seamless experience that integrates well with their mobile device’s operating system. While this is all well and good, native mobile apps still suffer from the general user fatigue of having to download “yet another mobile app”. Considering the pros and cons of mobile web apps and native mobile apps, how then can we reconcile the two so we can benefit from both high traffic AND high user engagement. In other words, how can we have our “performance” cake and eat it too?

## Enter: PWA

A Progressive Web Application (PWA) is a web application with super powers, or as Google Engineer Alex Russell puts it, “_it’s website that just took all the right vitamins”_. Technically speaking though, PWA is a methodology that combines various technologies to deliver powerful and engaging web experiences. According to Alex himself, a PWA is defined as an application with the following distinct characteristics:

- Responsive
- Connectivity Independent
- App-like
- “Fresh”
- Safe
- Discoverable
- Re-engageable
- Linkable

In short, a PWA takes advantage of the characteristics of a native mobile app, resulting in improved user retention and performance, without the overhead of having to build yet another native mobile app. Now before you brand all of this marketing hogwash more suitable for hyping up sales than engineering, let’s take a look at Jeremy Keith’s interpretation of a PWA. He managed to distill the term down into the technical aspects of what makes an application specifically a PWA. From Jeremy Keith’s perspective a PWA consists of:

1. HTTPS
2. A service worker
3. A Web App Manifest

Technologically speaking therefore, a PWA is a progressively enhanced application that provides a native app like experience.

## Remember web, take your vitamins.

Building a web application is as much about traffic as it is about user engagement. Though a webpage might get a high number of unique visitors, that traffic can’t always be monetized—What’s the point of having a crowd when nobody buys anything? Ultimately like the web performance optimizations we covered last week, PWAs are about building to optimize for quality web experiences.
