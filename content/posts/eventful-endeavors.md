---
title: "Eventful Endeavors; Understanding how events shape a system"
description: ""
tags: [febontheweb, distributedsystems]
categories: []
date: 2024-02-08T23:42:27-06:00
draft: false
---

Change is inevitable, especially so in applications that ebb and flow with system changes and user requirements. Generally, changes are codified in the form of an event; an event like a ddos attack for instance triggers a reaction or a response from one or more nodes, which ultimately mutates the overall state of the universe in a system. 

Undoubtedly, events rarely happen as one offs. At any given time, a sequence of events flows through the system. Whether it be a cascade of related events or multiple isolated events, the system is consistently responding and adapting. 

As developers, we can control how we architect our applications to respond to changes in specific ways. If events need to be processed in real time, an Event Driven Architecture is used. On the other hand, if keeping an audit log of events is essential, an Event Sourcing Architecture is used.

## EDA
Event Driven models are composed of elements that are fairly decoupled and asynchronous . An event in an EDA is non blocking and is neither strictly tied to its origin (producer) nor to its consequence (consumer). This means that EDS systems are capable of handling a high volume of events without compromising (A)vailability. Though this comes at the cost of eventual (C)onsistency.

Message Queues via named queues are used to handle this form of asynchronicity and decoupling. Queues, with the explicit help of a message broker, act as a facilitator between a producer and a consumer and ensure events are delivered in a controlled manner. Since the responsibility of keeping track of streamed events is handed off to a separate process, message persistence and any concern around reliable message delivery can be optimized for in relative isolation from the rest of the system. RabbitMQ, and SQS are popular queueing libraries that enable message passing in an event driven fashion. 

## ESA
Event sourcing is a persistence pattern where events are stored in an immutable log and can be replayed as needed. Similar to an EDA, they can be asynchronous though they tightly couple producer and consumer with an event to preserve history. This makes them closely aligned to (C)onsistency since the order at which events occur is always maintained.

When storing events as they occur, you run the risk of having to store an exhaustive record of state changes. Compared to having a database that stores current state, an ESA involves a database that stores an immutable event log of all changes made in the system. Considering that changes add up over time, an ESA has to optimize for a large and fast growing database. For this to work in practice, an append only event store like Kafka can be used to complement the sequential nature of events.

=====

Events form the bedrock of change in a distributed system. Understanding the nuances of an event driven or an event sourced approach is useful to tailoring your app for either consistency, availability. It’s worth noting, that the two are not necessarily mutually exclusive. ESA captures data changes in an event, while ESA communicates these changes across the system. If you wanted to harness the strength of either system, you could build a write service that publishes the event to an event log and a read service that reads the event from the log, thereby creating a message flow that is both event driven and event sourced. Whichever way you go, you’ll no doubt benefit from the resilience of a system that can handle change. 


