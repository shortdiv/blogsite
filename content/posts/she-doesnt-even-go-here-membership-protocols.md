---
title: "She Doesnt Even Go Here! Defining membership in a distributed system"
description: ""
tags: [febontheweb, distributedsystems]
categories: []
date: 2024-02-06T22:12:54-06:00
draft: false
---

In a distributed system, failures are to be expected. Whether it be a fault of the network or the node, failure is disruptive to the entire system. Failed processes struggle to recover and receive updates. Healthy nodes that try to connect to a failed node might fail completely or receive stale information, which can jeopardize the integrity and overall (C)onsistency of the system. To mitigate this, nodes have a failure mode, which it codifies in the form of a membership protocol. 

This protocol distinctly highlights to each node every process in the system; a membership list so to speak. The eligibility criteria to stay a member is straightforward, nodes must detect a failure and actively manage and synchronize their membership lists. It achieves this primarily via a heartbeat or through SWIM.

## Heartbeat
Heartbeat detection is a mechanism to track a node’s availability in a distributed system. Each node sends a signal (heartbeat) to other neighboring nodes *at a regular cadence* to inform them that they are alive and well. If all heartbeats are sent and received successfully, all nodes are assumed to have maintained their membership status. However, if a heartbeat is missed (which is more realistically the case) nodes go into active failure recovery mode. 

First, they verify that the failure was accurately detected. A node that detects a failure (node A) marks the suspected failed node (node B) and tries to send a follow up heartbeat. Depending on the failure threshold and timeout interval, sequential heartbeat failures to the same node (node B) confirm a failure and the node initiates a failover to compensate for the change. Remaining nodes are updated on the membership list change and the load is rebalanced. 

## SWIM
SWIM stands for “Scalable Weakly-Consistent Infection Membership” and is the process of failure detection and recovery where every node pings a random subset of nodes to maintain membership. Unlike a heartbeat, SWIM neither relies on interval based pings nor does it spam every node for an aliveness check. 

A ping is sent and an ack is received. Order is maintained. The moment an ack isn’t got back, a node is marked as a suspected failure and requests for confirmation are made. A random subset of nodes are then picked to verify the failure. If all nodes are met with failure, the failure is confirmed, the node is ejected and the membership list update is disseminated across the nodes. 

=====

If you’re starting to think that this whole updating the nodes thing sounds a lot like Gossip, I’d say your observation was rather acute. Notably because, Gossip is a communication protocol that complements failure detection. When a failure is identified in the system, Gossip (among many communication protocols) can be used to distribute the information across the system as quickly as possible. In a way, Gossip is a means to the end of failure detection.

## Addendum
To examine failure recovery in heartbeat detection further, it’s worth noting that membership is never truly egalitarian. There is a concept of a primary leader node and secondary follower nodes. If the failure happens to the secondary node, nodes are simply reshuffled and data might be redistributed. However, if a failure happens in the primary node, the primary node is shut down immediately before a secondary node moves in to replace it. This prevents any chance of a “split brain” where 2 nodes vie for the primary role and corrupt the system with stale information. 

