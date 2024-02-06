---
title: "Spilling the Hot Gossip Protocols"
description: ""
tags: [febontheweb, distributedsystems]
categories: []
date: 2024-02-05T23:02:10-06:00
draft: false
---

In a distributed system, communication is crucial to ensuring no node becomes stale. Updates can happen in 2 main ways, through consensus, or through gossip. In a consensus model, nodes attempt to reach quorum by mutually agreeing on the order of updates or periodically voting on and rotating the leader in charge of distributing updates to fellow nodes—I covered the ins and outs of this in [an earlier post](https://shortdiv.com/posts/how-to-be-consistent-in-a-distributed-context/), if you’re curious to learn more about it. Gossip is a concept analogous to consensus. It similarly keeps nodes updated except it achieves this via epidemic theory; If one node is infected, the entire population of nodes will eventually become infected. 

The key concept in gossip is that every node is responsible for periodically sending an update to randomized neighboring nodes such that after a sequence of cycles—log(n) of the total number of nodes—the message would be assumed to be disseminated completely. Since gossip doesn’t rely on synchronization, each node works within the bounds of its own clock and is only concerned with a small subset of neighboring nodes. 

Like any good distributed protocol, gossip comes with a set of variants, 3 to be exact; push, pull and a hybrid push/pull approach.

## Push-based gossip
In a push based approach, only up to date nodes actively participate in gossip by sending updates (rumors) unprompted to their more passive, uninformed neighboring nodes. The update (rumor) passing happens in periodic stages where one or a few nodes spread the hot gossip to the next subset of nodes which in turn sends them to the next subset until every node is brought up to speed and a rumor is assumed to have been successfully rumored. In this model, only nodes that are directly connected can communicate, and from a single node’s perspective, knowledge of the global community of nodes is irrelevant. Like the spread of an epidemic that remains robust despite the conditions (looking at you covid-19 winter), the efficacy of the spread remains unaffected if any failure in transmission happens. Assuming updates are not frequent and the possibility of the system being overloaded is low, some other node will just sneeze an update into existence.

## Pull-based gossip 
In a pull based approach, all nodes actively participate in the distribution of an update. Nodes are not informed of any hot gossip unless they explicitly request it. It’s worth noting, pulling for updates don’t happen all at once. Instead, one or a few nodes periodically poll a random subset of other neighboring nodes to check for any updates that may have happened since their last contact. This makes updates slow but also resilient to degradation. While a node has to wait until the next polling interval to receive an update, it can continue to retry and respond with cached data without worrying about being totally left behind. The assumption here is that frequent updates are happening within the system and so a node is never completely out of the loop; hey, way to (not) be forgotten. 

## Push/Pull
In a hybrid approach, all nodes equally push and pull for updates within the cluster. The benefits of a push and a pull approach are leveraged such that the higher communication happening between nodes asking for and sending updates leads to faster convergence where every node is updated within fewer interval cycles. This of course assumes overlap or simultaneity, where a push and pull phase happens at the same time or shortly following the other, thereby reducing the time it takes to propagate an update. Considering that not every node being polled will have an update, this hybrid approach provides an added guarantee that some neighboring node will have some hot gossip worth sharing. Admittedly, implementing a push pull protocol is complex, since the overlap adds extra overhead and complexity. The added noise may mean the real hot gossip is harder to keep track of and updates (rumors) remain lukewarm at best.


=======================

If we were to contextualize gossip within the CAP theorem, it would firmly be in the AP camp. Gossip is highly available and partition tolerant but only ever *eventually* consistent. Hitting one side of a partition might beget radically different responses than hitting another. Nevertheless, gossip perseveres in no small part due to its adaptability and resilience in a distributed system. After all, you’re nobody until you’re talked about. xoxo. 



