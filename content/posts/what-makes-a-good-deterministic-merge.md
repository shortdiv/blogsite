---
title: "What Makes a Good Deterministic Merge"
description: ""
tags: [advent, local-first]
categories: []
date: 2025-12-12T22:19:26-05:00
draft: false
---

The goal of every data reconciliation algorithm is to ensure all replicas converge on the same state of the world, in spite of concurrent changes. The best way to achieve this is through a deterministic merge where the same result can be guaranteed regardless of the order or timing of updates. The backbone of a deterministic merge is one that is associative (grouping doesn’t matter), commutative (order doesn’t matter) and idempotent (reapplying changes yields the same result).


- Associative: (a ⊔ b) ⊔ c = a ⊔ (b ⊔ c)
- Commutative: a ⊔ b = b ⊔ a
- Idempotent: a ⊔ a = a

These ACI properties are all key characteristics of a CRDT. Let’s examine them in detail by returning to the example from my last post.

In this example, two users are concurrently editing the word “pace”, user A deletes the letter “c” and user B adds the letter “g” after the character “a”. With a deterministic merge (`⊔`), all replicas converge to `"page"`, no matter the merge order or duplicates. This is an incredibly simplistic representation but bear with me: 


- Associative — Grouping is not relevant to the final state
    - (“pace” ⊔ delete c) ⊔ insert g = “pace” ⊔ (delete “c” ⊔ insert g)
- Commutative — Order of operations don’t affect the final state 
    - insert “g” ⊔ delete “c” = delete “c” ⊔ insert “g”
- Idempotent — duplicates don’t change the final state
    - insert “g” ⊔ insert “g” = insert “g”
    - delete “c” ⊔ delete “c” = delete “c”  

While ACI provides a rubric for enforcing determinism, the real world often presents edge cases that undermine convergence. One classic challenge comes from maintaining causal context. Many CRDT systems attempt to preserve deleted characters as tombstones so that future operations referencing those positions can still be ordered correctly. While this isn’t inherently nondeterministic, the issue is that with time, memory growth becomes unbounded and causes unstable behavior when the internal garbage collector in response to memory pressure starts evicting or reordering data. Another challenge to deterministic merges is ambiguous identifiers where identifiers which encode logical placement are too coarse and inconsistent which causes incorrect ordering and inconsistent merges. 

Much research has been done to mitigate these problems. Solving ballooning memory from tombstones demands some form of garbage collection or compaction. With garbage collection and compaction, we can safely delete tombstones once all replicas have observed the deletion and compress historical data. As for ambiguous identifiers, there are methods to generate globally unique identifiers by specific a lamport timestamp and node ID, which preserves causal relationships between operations. 

What makes a deterministic merge “good” ultimately comes down to efficiently and consistently producing the same result on all replicas while preserving user intent. Achieving this is more than just satisfying ACI in theory though that in itself is a good goal to measure up against for success. 