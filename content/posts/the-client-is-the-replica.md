---
title: "The client is the replica"
description: ""
tags: [advent, local-first]
categories: []
date: 2025-12-08T18:56:18-05:00
draft: false
---


With the rise of mobile in the early aughts, where updates and collaborative edits felt instantaneous (since they wrote directly to local storage and used shared network drives) the traditional client-server model of the web proved clunky. Instead of instantaneous updates that were common to mobile interactions, web updates incurred added latency from the extra round trip it had to make. The responsiveness of native apps set a new precedent for user experience.

This demand for immediacy on the web, for one, drove a wave of innovation in “data sync” type patterns. In 2012, MongoDB introduced oplogs that allowed for changed data captures (cdc) and replication. As opposed to polling for changes as was customary, oplogs enabled subscribing to a stream of granular updates in real time. MeteorJS built a framework on top of this primitive with the distributed data protocol (DDP), a stateful web socket protocol to communicate between the client and the server. When data changed on the server, DDP pushed updates directly to Meteor's client-side cache and refreshed the UI without the need for any manual fetches or clunky re-render loops.

These early innovations hinted at a deeper shift that was happening in the web, which would ultimately result in the birth of the local-first movement. To achieve truly responsive, real time apps, it was not sufficient for clients to be stateless displays, they had to hold and manage state, much like a database replica. Current real-time frameworks like Yjs, Automerge and Replicache descend from this very intuition. The complexity of replication needed to happen on the client for real time functionality. 

In this client-as-replica architecture, each client has a fully-fledged copy of the database to which they can independently make changes to. Any updates to one client replica gets sent to every other copy and is eventually synchronized. Conflicts are resolved automatically using a set of deterministic rules, ensuring that all replicas converge on the same state. A robust local-first app is therefore fundamentally a set of coordinating replicas. 

By making this assertion, I’m admittedly glossing over the complexities of what it means for clients to act as replicas. Once we move the logic of state management and coordination to the client, we introduce a host of other problems including convergence or conflict resolution, causality and event ordering; these are the classic challenges of building distributed systems—all of which are topics for future posts. 

All in all, local-first apps succeed precisely because clients act as replicas, holding state, and synchronizing updates to support collaboration in real time. More on state management and how they do this in my next post! 