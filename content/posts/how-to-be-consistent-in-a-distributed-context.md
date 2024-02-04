---
title: "How to Be Consistent in a Distributed Context"
description: ""
tags: []
categories: [febontheweb, distributedsystems]
date: 2024-02-03T21:33:14-06:00
draft: false
---

## What does it mean to be consistent?
In an earlier post, we talked about the importance of building consensus when it comes to ensuring consistency in a distributed setting. Loosely, consistency focuses on keeping all nodes in a system up to date on changes as they happen in real time or near real time. This ensures the reliability of the system as a whole, so users are never (fully) let down when parts of the system unexpectedly go down.

Funnily enough, consistency in distributed systems is not consistent. Unlike the formal definition of the term, consistency varies depending on context and system requirements.  In some situations, we may want strong consistency where every node has the same data at precisely the same time, while in others immediate consistency is not strictly necessary. 

## Strong(ly) consistent
Ordinarily when we think of consistency, we assume strict or absolute consistency, where all writes are instantly visible to all reads. If we were to visualize this in the context of music, strong consistency is akin to a symphonic orchestra. Each musician plays a predefined sheet of music (reads) alongside a conductor’s instruction (writes). Perfect synchronicity is reached because all “nodes” are in harmony. 

Implementing a system that has strong consistency is of course much harder than the synchronicity achieved in a typical orchestra; *the metaphor serves to explain the concept however contrived it may seem*. Musicians in an orchestra are colocated. In a distributed setting, nodes are globally distributed. If we were to spread musicians across regions, it would immediately become apparent how hard strong consistency is, chiefly because of latency. Keeping nodes up to date with absolute certainty is complex and resource intensive. This is why most applications aspire for a more loosely defined version of consistency.

Even so, this type of strong consistency is not an impossible outcome. Consensus protocols like Paxos and Raft, introduce the concept of an election/voting model where there is an obvious leader and followers through which updates are propagated. Tools like Google’s Bigtable and Spanner are key examples of systems that implement strong consistency.

## Sequentially Consistent
A more relaxed approach to this is sequential consistency. Instead of all writes being broadcast to nodes when it happens in real time, writes across nodes are globally ordered and only broadcast to other nodes in the order it was received. To achieve this, a write queue is implemented to which updates are recorded. To extend our music metaphor, sequentially consistent systems operate like recorded or streamed music. When you play a song, the notes and lyrics are always heard in the order they were arranged. Even if listeners are distributed, the song follows a sequence in which is was recorded, and despite possible lag, the music is consonant.

Achieving sequential consistency requires coordination mechanisms such as distributed locks and replication protocols. This way, no two nodes can simultaneously perform a write. Apache Zookeeper is a prime example of a system that implements a sequentially consistent model. It provides primitives via locks, queues and barriers so state is maintained in a consistent order. 

## Eventually Consistent
If we were to weaken our consistency requirements further, we reach eventual consistency. In this model, nodes diverge temporarily but eventually converge to the same state. Here order is not guaranteed. In music, this is akin to a jazz performance. Jazz encourages free musical expression in the form of improvisation. There are often temporary deviations in the performance but there is an eventual harmonic resolution; *listen to John Coltrane’s version of My Favorite Things if you want a tangible example of this.* 

Evidently, a system that favors eventual consistency has to deal with some element of conflict resolution. Last writer wins, and vector clocks are popular methods to determine some form of partial ordering of events across nodes. And well known tools like Apache Zookeeper implement this system under the hood. In eventually consistent systems, high availability and low latency are prioritized and they are generally handy for read heavy applications. 


## Navigating consistency
Tailoring a consistency model to suit an application’s provide a  framework to decide how best to architect an application. In weighing this decision, it’s useful to remember the guiding principle of the CAP theorem, among the 3 properties of shared data systems—consistency, availability and partition tolerance—only 2 can ever be achieved at a given time. If your application needs skew toward high availability, eventual consistency might be the way forward while one that requires consistency would be better served with a strongly consistent model. 


