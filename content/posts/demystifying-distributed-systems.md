---
title: "Demystifying Distributed Systems"
description: ""
tags: [febontheweb, distributedsystems]
categories: []
date: 2024-02-01T23:47:13-06:00
draft: false
---

# Demystifying Distributed Systems: the what and why

If you deploy an app today, dealing with a distributed system is an inescapable problem. Whether it’s understanding how to balance requests, or synchronizing data replication, at least some aspect of your deployment will require orchestrating and coordinating multiple servers to operate in unison. The goal of “distributedness” here is to have things work across regions and systems in a way that is completely imperceptible to a user.

## But why tho?
If you ask me, distributed systems is no simple task. Thinking about the implications and edge cases that come with a globally distributed app adds cognitive load. Especially when all you care about is getting your app shipped. Not considering it however comes with its own set of drawbacks, namely performance and reliability. Sure your app might not see the type of load a site like Ticketmaster sees at the launch of Taylor Swift concert ticket sales, but the gains from reduced latency and faster response times for users across the globe are significant. So how does one plan an app with distributed systems in mind?

## How
At the risk of sounding like a prompt for a systems design interview, we can think about this question by focusing on some core concepts. Namely, concurrency, latency and fault tolerance—*I’m heavily simplifying things here so this doesn’t come close to encompassing all things distributed systems*. 

### Concurrency
Many nodes make light work. When dealing with handling user requests or processing data, a concurrent system where multiple nodes work together results in faster response times. Instead of relying on a single server to fulfill a request, work is split and handled concurrently. This has the added effect of lowering resource utilization which can keep the cost of running an app down. 

At the application layer, the techniques for concurrency vary based on the language and framework you use; you might use web workers in JS land, but concurrency primitives like genservers in elixir/phoenix. The comprehensive way in which you can achieve concurrency however is in the way you store and handle data. Many database systems enable replication and sharding to distribute data across nodes so requests can be handled at scale. Load balancers are also handy ways in which to evenly distribute requests across instances, so not one single server is stuck doing all the work.


### Latency
The downside to distributing app and data instances is of course keeping everything in sync. As time would have it, clocks on different systems dance to different beats (i.e. clock drift in serious computer speak). This makes coordination across nodes challenging, since we can’t know when something did or did not happen definitively. For an app to be reliable, we need to make sure a transaction or an action is properly accounted at the time it happened. We wouldn’t want 2 people trying to buy the same seat at a concert now would we? 

One way to account for this kind of latency is to implement causal ordering where an event causally depends on another, and is therefore ordered after that previous event. A quick way to ensure this kind of ordering is by implementing a concurrency control like a lock on a database so no two entities can access or write to a specific record at the same time.

### Fault Tolerance
In an ideal scenario, applications will continue running until we tell them otherwise. This only ever happens when we have systems in place to allow for instances to stand up and take over when one falls over. Tolerating failures mean not only having systems in place to know when a failure happens but to also do something about it. 

There’s no quick fix for creating a fault tolerant system. It’s a cohesive approach that involves setting up monitoring/alerting, and automated recovery mechanisms to name a few. Prometheus and Grafana are fantastic monitoring and alerting tools that provide insight into an app’s health metrics over time. Many popular deployment platforms also offer basic logs and usage graphs that you can utilize for basic observability. Recovering from a failure is slightly more tricky and can range from configuring a service to automagically restart or rollback on account of a failure, to setting up an orchestration engine like Nomad or k8s horizontal pod autoscaling to reschedule tasks  onto different healthier instances. 

Distributed systems represent a huge advancement in how we build and ships apps today. There’s always more rabbit holes to fall into when it comes distributed systems, but understanding the broad strokes is essential to building more robust and reliable apps. 


