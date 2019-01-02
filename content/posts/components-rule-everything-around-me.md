---
title: "Components Rule Everything Around Me"
description: ""
tags: [components, opinion]
categories: [components, opinion]
date: 2019-01-01T21:51:14-06:00
draft: false
---

Componentization is the central concept driving frontend development today. It enables us to encapsulate core logic of a user interface into smaller chunks thereby making them easier to reason about. While each of these components exist in isolation, they work in concert to build a unified interface. This relative isolation also means that components are reusable and can be easily mixed and matched to create a variety of patterns and styles. An example that best illustrates this is the screwdriver. Though there are many types of screwdrivers, like the phillips head, the flat head, the allen head and so on, these variations can be made by simply changing the head of the screw instead of having to buy multiple single use screwdrivers. By enabling a high level of isolation, components thereby promote ownership while also maintaining the right conditions to efficiently scale.

The promise of reusability and reduced complexity was a major selling point for developers across the board to adopt componentization. Even so, its flexibility also brought with it many challenges, the most notorious of which is bloat. Adhering to the single responsibility principle is an ideal best case scenario. However, most applications are complex and given time, they all too easily grow in complexity. How then can we ensure the benefits of componentization while also preventing bloat?

A neat trick I’ve learnt to tackle bloat is to think about components in terms of their function, similar to the process we take when we name a function or a variable. If you find yourself struggling to pin down the function of your component (which is technically a function), then your component is likely doing too much. There’s of course no hard and fast rule here and sometimes you may want a component to do more than one thing. Even so, this trick might be a quick way to help create more resilient components that will survive the test of time. Your future self may even thank you for it.
