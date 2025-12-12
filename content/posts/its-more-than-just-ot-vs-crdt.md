---
title: "It's more than just OT vs CRDT"
description: ""
tags: [advent, local-first]
categories: []
date: 2025-12-11T20:33:10-05:00
draft: false
---

When it comes to data reconciliation in the context of building real-time, collaborative user experiences, two major techniques are often discussed: Operational Transform (OT) and Conflict-free Data Replicated Types (CRDT). OT was developed in the late 80s and pioneered the foundational principles of real time collaborative editors. CRDTs emerged much later (around 2006), and were partly motivated by the complexities of implementing OT and the correctness pitfalls it can introduce. If we compare the two methodologies more broadly, OT is a strictly operation-based approach to data reconciliation while CRDTs offer both state-based and operation-based approaches. Examining the two from this lens, it’s clear that OT and CRDT are not simply opposites. More accurately, they are representative examples within a broad spectrum of reconciliation strategies. A more meaningful comparison therefore would be state-based vs operation-based approaches. This better captures the fundamental differences in how changes are propagated and merged across replicas. 

In an operation-based reconciliation model, each replica sends its own change operations, like edits, inserts and deletes, to other replicas as they happen. To preserve consistency across replicas, operations must either naturally commute or be transformed against concurrent operations. Consider the case of two users editing the same word “pace” concurrently. 


- User A deletes the character at index 2 (`'c'`).
- User B inserts the letter `'g'` at index 3.

In classic OT, the insert and delete operations are applied relative to one another. So we get:


- delete-first: “pace” → “pae” → “page”
- insert-first: “pace” → “pacge” → “page”

In other variants of operation-based algorithms, a unique identifier is applied to an operation that describes its position relative to surrounding characters. These identifiers allow operations to be applied directly, in any arrival order, without requiring an explicit transformation step. So instead of mutating the string step-by-step, the edits become:


-  `delete("c", idA)`
- `insert("g", idB)` 

where `idA` and `idB` are simplified position identifiers that encode the logical placement of each character. In spite of the implementation details of various operation-based techniques, they all revolve around propagating and merging diffs.

In contrast, state-based focuses on the entire state of data rather than on individual operations. Each replica periodically shares its full state with other replicas and a deterministic merge function is applied. The merge function here is designed to be associative, commutative and idempotent. Consider the previous example where two users edit the word, “pace”: 


- User A deletes `'c'` → `"pae"`
- User B inserts `'g'` after `'a'` → `"page"`

When either replica receives the state of the other, the merge function compares the two versions and combines them deterministically into a single convergent result. State-based reconciliation doesn’t need to track or transform individual operations and relies heavily on an internal merge function for convergence. In a sense, this makes state-based operations simpler to reason about.

Regardless of the approach, both state-based and operation-based transforms have the same goal in mind; to enable all replicas to converge on a consistent state. Framing the discussion as state-based vs operation-based instead of OT vs CRDT brings to light the more important question; How should changes be propagated and merged? From this perspective, the debate shifts from “which algorithm is better” to weighing tradeoffs between different design choices. This is precisely what we’ll explore in the next post.
