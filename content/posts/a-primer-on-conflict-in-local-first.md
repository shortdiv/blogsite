---
title: "A Primer on Conflict in Local First"
description: ""
tags: [advent, local-first]
categories: []
date: 2025-12-10T23:50:49-05:00
draft: false
---

In my last post, I argued that conflict in local-first is an inherently human problem. Without understanding the intent, and expectations of the end user, reconciliation is not always meaningful, given that correctness doesn’t equal usefulness from a user perspective. Before we dive into the technicalities of how conflicts get resolved, it’s worth exploring why drift happens in the first place and the basics of how it gets resolved.

When we work in settings where multiple replicas can be edited independently, conflict is a direct, unavoidable result. Replicas can drift apart for several reasons: network latency, concurrent changes, and offline edits are all a natural cause of divergence in local-first systems. Once the replicas diverge, the need to agree on consistent state arises. The goal here is deterministic reconciliation. In other words, given a set of changes, all replicas should eventually all converge on the same result.

There are numerous ways of handling this. The most popular amongst them is Conflict-free data structures (CRDTs) which are special data structures that enable automatic merging of concurrent changes without losing any updates. Other mechanisms include state-based reconciliation, which periodically exchanges full replica states, operation-based reconciliation, which propagates operations to other replicas in a deterministic order, and causality tracking, which ensures operations are applied in a way that respects their dependencies. Each of these comes with its own set of tradeoffs in complexity and control.

Conflict is the natural consequence of autonomous replicas; reconciliation ensures technical correctness. With this understanding we can dive deeper into the mechanics of a deterministic merge in the next post! 