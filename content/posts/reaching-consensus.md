---
title: "Reaching Consensus"
description: ""
tags: []
categories: []
date: 2024-02-02T23:59:03-06:00
draft: false
---

In a distributed setup where nodes share the load of processing requests and storing/retrieving data, reaching consensus is crucial to ensuring consistency in an application. To return to the concert ticket sales example from the last post, we wouldn’t want 2 users buying the same seat since that violates the condition of assigned seating. Consensus can then be described as ensuring all nodes agree on a specific value or a state *in spite of a potential failure or delay*; there lies the rub.

Conveniently enough, consensus isn’t that much different in software than in human relationships; albeit more formal ones like systems of government. In both scenarios, individual parties work together to reach an agreement on a particular issue. And what makes consensus in those cases most effective is when a clearly defined protocol is followed. Oftentimes, there is a concept of an elected leader around which others coordinate (raft), or a system of proposing and voting (paxos). 


## Paxos
Fundamentally, paxos also aptly known as “the part time parliament” operates in 3 main phases: proposal, acceptance and commitment. In the proposal phase, a node or node(s) make a proposition on a specific value to its fellow nodes, this is known as a prepare request. When the fellow nodes receive the first prepare request (whichever is fastest), it responds with a prepare response, promising never to accept another request, which the proposer tallies up. In the acceptance phase, the initial proposer then checks back with its fellow nodes with confirmation, an accept request confirming that they agree to the initial proposition. Since consensus is built by majority, the proposition with the highest votes wins. The decision is then finalized in the commitment phase and all nodes are informed of the update. 

As you may have surmised however, paxos can be a bit challenging to wrap your head around considering its many failure edge cases and so it can be complex to implement. 

## Raft
Raft was introduced as a response to Paxos. It was designed to be easier to understand and implement. In Raft, one node is elected as the leader among nodes in a cluster. The leader here is responsible for ensuring all nodes are informed of an update via coordination and replication. The leader election is fairly arbitrary and elections are staggered at randomized times to reduce the likelihood a split votes. Leaders are decided by majority vote. And they remain leaders as long as the follower nodes believe the leader to not have failed; i.e. to be alive and well and receiving/sending requests successfully. 

Leader failures are handled by initiating leader elections when a majority of nodes are still reachable. Compared to Paxos, raft is a lot more straightforward since it doesn’t require handling multiple propositions from nodes who want to be a leader. 

The process of reaching consensus involves a lot of coordination and cooperation. Nodes must understand the fundamental protocol and system of making a decision. As developers building for a distributed system, understanding consensus can help us keep track of how to reconcile changes and updates that stands up to failures, or network delays.