---
title: "The Not So Hidden Life of Nodes; an exploration of how nodes talk to each other"
description: ""
tags: []
categories: []
date: 2024-02-07T22:02:37-06:00
draft: false
---

Distributed nodes share neither memory nor a logical clock. In order to effectively keep a system in running order, nodes need some way to communicate with one another to share data and coordinate complex tasks. Interprocess communication (IPC) plays an integral role in this. IPC is the mechanism that enables a server to query a database instance and resolve a request with the associated data successfully. Without it, nodes remain stranded akin to the people in the Tower of Babel, connected by infrastructure but unable to communicate with one another. 

To communicate, nodes generally need one of 2 things: (some form of) shared memory or a message passing mechanism. 

## (Distributed) Shared Memory
The true spirit of conversation consists of building on shared knowledge and perspective. For nodes to converse where they can access and modify state with low overhead, a shared state of the world, usually in the form of shared memory is useful; aka a shared memory. In a distributed setting where nodes are not colocated, a truly shared memory is impossible. However, shared memory can be emulated notes form of a distributed shared memory (DSM). 

DSM gives a distributed system the illusion of a shared memory space though each node has its own isolated physical memory. The shared bit happens when each node in the system is allowed access to each other’s memory. DSM is essentially a higher level process that manages memory across nodes. Naturally, the latency incurred from this form of memory access is considerable as opposed to memory access in a physically colocated shared buffer. Even so, techniques like Remote Direct Memory Access (RDMA)—*The deus ex machina of latency problems in a distributed system*—can be utilized for higher-throughput and lower-latency data transfers over a network. 


## Message Passing
Message passing enables processes to communicate and synchronize tasks without sharing a common address space. The idea here is simple, nodes exchange information, which can happen synchronously (blocking) or asynchronously (non-blocking).

A commonly used method for message passing is via an API known as Message Passing Interface (MPI) (*of course*) which defines a set of functions allowing processes to send, receive and manipulate data. The main idea behind an MPI is the hierarchic organization of node and the division of labor within that structure. The MPI defines a main node and worker nodes so tasks can be distributed and aggregated across workers. The main node serves as a facilitator and provides nodes with a language to communicate point to point or in a collective manner. 

=====

IPC serves as a fundamental tool for enabling communication and coordination across nodes. It offers a programming model to communicate and reason about communication across a cluster via IPC. 