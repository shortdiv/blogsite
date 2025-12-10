---
title: "The semantics of conflict"
description: ""
tags: [advent, local-first]
categories: []
date: 2025-12-09T23:28:42-05:00
draft: false
---

Conflict is a recurring topic of discussion in the local-first space. This is unsurprising given that real time collaboration and intermittent offline access inevitably introduces drift between replicas. When multiple users collaborate on a single application or even when a user works on the same application from separate devices, change conflicts occur. This echoes a foundational principle in distributed systems: when networks partition, systems must decide how and whether to be consistent or available. In fact, much of the conversation around conflict resolution in local-first draws directly from distributed systems. Topics such as Conflict-free Replicated Data Type (CRDT) and Operational Transform (OT) all stem from key research in distributed systems. However, unlike in distributed systems where conflict is a matter of direct data reconciliation, conflict in local-first is a result of collaboration and is therefore, arguably, a human problem as much as a technical one.

If we return to the aforementioned example of a user working on an application from different devices, conflict extends beyond the technical realm. Even when the system reconciles divergent state, the user’s workflow preferences and priorities may not necessarily align. CRDTs prevent data loss, but they neither encode intentions nor represent changes that matter most to a user. In this context, conflict emerges less from the data itself and more from a mismatch in expectations of what the changes represent and how they should be interpreted.

A key point worth emphasizing here is that in a local-first world, not all conflicts are errors. More often, they’re a natural side effect of humans working together asynchronously. Conflict, in this sense, becomes a user experience challenge rather than a failure of the underlying algorithms. Apps like Figma illustrate this exceptionally well. Instead of merging divergent edits behind the scenes, Figma makes everyone’s intentions visible, thereby minimizing conflict in the first place. Moving cursors and clear text indicating things like “Evan is editing this text” shift the locus of conflict from data reconciliation into the social space, where it belongs.

How conflicts are resolved is fundamentally application-dependent, because reconciliation itself is subjective. By reducing conflict resolution to a purely algorithmic process, we lose the plot of what it means to build collaborative, real time user friendly experiences. To win, we should design experiences that respect the human side of conflict that honors user intent, and supports the real complex dynamic that underlies human collaboration. 