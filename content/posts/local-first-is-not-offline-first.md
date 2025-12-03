---
title: "Local-first is not offline-first"
description: ""
tags: [advent, local-first]
categories: []
date: 2025-12-02T22:53:43-05:00
draft: false
---

In my last post, I mentioned that what makes an app local-first is its ability to keep running even when a connection falters. At first glance, this might look a lot like the offline-first movement that arose alongside the progressive enhancement wave of the mid to late 2010s. But there’s a subtle distinction. Offline-first apps focused primarily on staying functional during network interruptions but the server remained the primary data source. Data in this context is stored locally until a connection is restored, after which the locally stored data is deleted in favor of the remote store. A restored network connection progressively enhanced the experience and syncing only happened when there was new data created during the interim offline period to upload.

In contrast, local-first treats offline capability as a natural side effect of giving the local device authority over the data. Because data is **local-first** syncing happens opportunistically rather than on every interaction. All reads and writes happen locally, so the app stays responsive and doesn’t depend on network calls, which significantly reduces latency. Naturally, conflict resolution is a core challenge in a local-first world, which is evidenced by the sheer number of sync engines emerging in the space today. 

The distinction between local-first and offline-first matters because it shifts the center of gravity in software architecture away from the cloud to the user’s local device. While the offline-first movement responded to latency and network constraints, the local-first movement is a reaction to cloud dependency. Local-first carries a philosophical implication and forces us to contend with the question of data sovereignty and user autonomy. 

For all its advantages, local-first has yet to become mainstream. Building apps where every device holds authoritative state requires rethinking the architecture around distributed systems and reactive data flows. Before diving into the technicalities of how all of this works, I want to cover why now. In my next post, I’ll explore the conditions that birthed the local-first movement; a perfect storm of hardware advances and software innovations that made its rise inevitable.
