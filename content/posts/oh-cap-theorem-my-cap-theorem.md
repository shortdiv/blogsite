---
title: "Oh Cap Theorem My Cap Theorem"
description: ""
tags: [febontheweb, distributedsystems]
categories: []
date: 2024-02-04T14:24:41-06:00
draft: false
---

In an earlier post, I glossed over a concept that forms a fundamental tenet of systems design; the CAP theorem. To reiterate, the CAP theorem states that of 3 desirable traits in a distributed system, Consistency, Availability and Partition tolerance, only 2 can be prioritized at any given time. It highlights the tradeoffs we make when we design for a distributed setting.

The CAP theorem was birthed from the move away from vertical scaling where we simply sized up machines for greater processing capacity to horizontal scaling where machines work in a distributed and parallel fashion. The CAP theorem specifically focuses on databases, since it highlights the difficulty of maintaining state when reads and writes can originate from anywhere and can easily be disrupted in the event of a network failure.

## Consistency
Consistency as we covered yesterday, focuses on applying an update to all relevant nodes in logical time. Events that occur are ordered across nodes independent of a globally synchronized clock and replicated in that same order. As we also discovered in the earlier posts, immediate replication or a “strongly consistent” system is costly to maintain. Depending on how and what we optimize for when we build our applications, an element of lag is to be expected in most cases.


## Availability 
High Availability is an oft prioritized trait of many a system. It ensures a system is operational all of the time, where every request is guaranteed a response regardless of the state of individual nodes. Of course, with this comes the caveat that the response *might not* be the most up to date and a write might conflict. High availability is mutually exclusive to consistency. This is where conflict resolution tools like Last Writer Wins (which CassandraDB implements) or vector clocks to determine if two events are concurrent or if one precedes another (which DynamoDB implements) are handy to enable resolution. 


## Partition
Partition tolerance is the ability to withstand breaks in the connection between nodes. Generally this happens in a network failure, where a node or multiple nodes are forced offline and all connecting nodes break away from the entire system. Failures like this cause messages to be delayed or completely dropped since communicating across a network partition becomes impossible. A system that is partition tolerant can sustain network failures as long as the failure is limited and doesn’t take down the entire network. Theoretically in a tolerant system, the remaining nodes will still be able to respond to user requests since dead or lost nodes can no longer communicate with the system.


When we look at the CAP theorem more closely, it becomes obvious that even if only 2 traits are possible, partition tolerance is necessary. The goal of a distributed system is to organize a group of machines to work together so it comes across as a single machine to the end user. With this objective, a request that receives a response, however annoyingly stale it may be, is preferable to no response at all. And so, the CAP theorem is really a decision between choosing consistency over availability or vice versa, at least that’s how I see it :D 