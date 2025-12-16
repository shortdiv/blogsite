---
title: "Sync the local-first powerhouse"
description: ""
tags: [advent, local-first]
categories: []
date: 2025-12-15T23:47:33-05:00
draft: false
---

One of the hardest problems in local-first software is sync. In previous posts, I talked about OTs/CRDTs, the role of the cloud relative to the client, and general conflict resolution. But I never quite landed on the core theme behind those ideas; sync is the bread and butter of data reconciliation in local-first software. Briefly, a sync engine is responsible for collecting changes, resolving conflicts and propagating these changes across all clients. Considering that every client operates on their own copy of the data, and can go offline for long, unknown stretches of time, a good sync engine must be designed for availability, partition tolerance, and eventual consistency the classic trifecta of trade-offs in distributed systems. 

Data access and updates in web apps have long been sequestered to the database. Most apps consist of a UI and some form of a data store connected through an API layer. In this model, data updates are imperative—the logic must explicitly define how updates happen. Sync engines seek to transform this relationship by bringing data logic into the UI. With sync, data updates are declarative—the logic defines what data is needed, not how it is fetched or merged. 

A sync engine consists of a few main components, namely, a local data storage, change detection, and conflict resolution. Popular sync engines like Automerge utilize local storage systems such as IndexedDB for reading and writing data from the client while maintaining an internal representation of changes as they occur. These changes can then be exchanged and merged across multiple clients, even when those clients have been offline for extended periods of time. It achieves this by modeling app data as a CRDT which is a data structure optimized for deterministic convergence regardless of update order. CRDTs are often framed as the end-all solution to conflict resolution but they are just a single piece in the bigger sync story. 

To synchronize state across devices, some form of network connectivity is necessary. Peer-to-peer is one way of achieving this but this is relatively uncommon in the local-first ecosystem. Most sync frameworks adopt either a “bring your own server” model or provide a cloud hosted service to mediate synchronization. The cloud may not own your data but it forms the backbone of the sync engine by collecting and relaying data updates across devices. Admittedly, the server model partially breaks the “offline as first class citizen” principle of the local-first ethos. The eventual goal of an effective local-first application is for it to outlive backend services managed by their vendors. It’s worth noting therefore that the server is neither the source of truth nor part of the critical path of a user interaction. In fact, it often operates independently of the core functionality of the sync engine as a whole and serves more as a “cloud peer”.

Sync is what brings everything together, enabling a truly collaborative experience that spans users and devices. Through it, the complexity of data resolution and coordination can now be clearly abstracted out into a well-defined layer that is mostly server agnostic, in the sense that you aren’t tied to a specific vendor or database provider. In local-first software, sync is truly the stuff. 
