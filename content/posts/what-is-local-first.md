---
title: "What is local-first?"
description: ""
tags: [advent, local-first]
categories: []
date: 2025-12-01T22:46:44-05:00
draft: false
---

I’m frequently amused by how often local-first software gets mistaken for community initiated software. The ethos is spot on, but the confusion is revealing: cloud first has become the de facto standard for building apps. Local-first challenges this notion and subverts the dynamic between cloud and device. It puts the device at the center of operations. In this way, local-first apps remain operational despite an unstable connection unlike cloud-first ones. This of course doesn’t disregard the cloud completely. In a local-first model, the cloud shifts to the role of facilitator, ensuring data is synchronized across devices and sessions. 

Admittedly, with the move to storing data locally comes the complexity of storing data and handling conflicts across devices. This becomes especially challenging when datasets grow and exceed the limits of a single device. We now have to contend with the question of how we partition our data, what to cache or compact and how to maintain consistency across devices. So why does local-first matter if it seems to introduce more problems for how we build?

Because those “problems” are really choices. By moving local-first, we regain control and are no longer at the mercy of cloud providers as the single source of truth. Developers now have the flexibility to design experiences that fully prioritize responsiveness and data ownership without having to surrender control to the cloud.

The local-first movement presents us with an alternate paradigm of building software, where apps are durable and user-centered. In the coming days this month, I’ll be exploring the local-first landscape, examining the tools and approaches that make this movement both powerful and possible. I hope you’ll join me.