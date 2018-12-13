---
title: "When Push Comes to Shove"
description: ""
tags: [pwa, advent, frontend]
categories: [pwa, advent, frontend]
date: 2018-12-12T19:36:20-06:00
draft: false
---

Push notifications are a simple way in which web applications can interact with users to provide them with timely updates and customized content. When integrated with service workers, push notifications allow web applications a more active and engaging experience that was previously reserved for mobile applications. Technically speaking, this feature is possible thanks to the Push API.

The Push API is what allows web applications to receive messages from the server, regardless of whether an application or a user agent is active. This API effectively gives developers control over delivering asynchronous notifications and updates to users who have opted in. In theory—if done right—push notifications allow for higher engagement. However, most of the time push notifications are disruptive to user experience. In a sense, push notifications have come to represent the web equivalent of that annoying sales person who hovers over your shoulder as you browse. Even browsers—[I see you firefox](https://support.mozilla.org/en-US/kb/push-notifications-firefox#w_how-do-i-disable-web-push-completely)—have taken to rolling out user settings so you can disable push notifications completely. With this poor sentiment around push, how can we effectively leverage them without being an annoyance to users?

To answer this and better assess the role push notifications plays in the grand experience of a progressive application, let’s dive into the details of how push notifications work.

## The first rule to push is push

At its core, a push notification is a conversation between client and server by proxy of web workers. In order for them to work therefore, two main conditions need to be fulfilled. The first is that service workers must be used and the second is that there needs to be buy-in from both client and server. Here’s a brief visual of what this process looks like:

![](https://d2mxuefqeaa7sj.cloudfront.net/s_C567C0A5648908E9E4962F5433869389BBA9C5D9F6F2EEFC714CF67D7066256C_1544662407610_Group.png)

When a user navigates to a webpage, they are presented with a push notification popup asking if they would like to receive notifications. On granting permission, the client then sends the request along to the server which then registers that that specific user wants to receive a notification should new content become available. When new content becomes available, the server sends a message to the service worker associated with that user. The service worker then sends that notification along to the user via a push notification popup.

## The UX of Pushing

Push notifications are by nature disruptive. Because they (by proxy of service workers) operate outside of a webpage’s ordinary render cycle, they will always interrupt a user’s workflow. Even so, we don’t have to be completely controlled by the immediacy that push notifications demand. For one, we can start by designing notifications with the user’s goals in mind.

**Make the Intent of Notifications clear**
Oftentimes, when users are met with push notifications, the intent of those notifications aren’t always clear. This is the main reason why we all find push notifications annoying in the first place, especially when we are presented with these popups on initial page load with hardly any context. From a web page’s perspective, the goal is to have users opt in. With this goal in mind, a better approach would be to provide users with some context around why they should subscribe to updates. For instance, if the page is a sports website like ESPN or NHL, notify the users that they’ll receive important game updates if they opt in to notifications. This clarity makes users more likely to opt in, instead of quickly dismissing a notification without a moment’s glance.

**Make notifications truly timely**
With most notifications, timing matters. In this day and age of information overload, the last thing you want to do is to add to the noise by sending users incessant notifications. One way to keep users engaged without feeling overburdened, is to figure out when an interruption makes sense. For example, we can send an active or regular user of a web app a notification asking if they’d like to receive notifications to stay up to date with content. Another useful case would be offering to send updates to users if they are accessing a weather-related app from an address where a storm is imminent.

**Make notifications silent**
One of the most intriguing uses of push notifications, was to not use the display aspect of them at all. While this seems counterintuitive, [Sebastiaan Andeweg](http://sebastiaanandeweg.nl/) demo-ed an application where he used the Push API to notify the service worker to cache newly updated content in the background. This can be a handy way to give users access to updated content even when they’re offline, which is most useful when subscribing to content from magazines, podcasts and blogs.

## Push, but don’t push too hard

Push notifications are a handy tool when it comes to increasing conversion and maintaining engagement with your web apps. They can give users important and timely updates even when users are not actively using an app. However, this very feature that makes them so powerful can also negatively affect user experience. But when used properly and with caution, push notifications are a great tool to boost user engagement.
