---
title: "The cloud is the cache"
description: ""
tags: [advent, local-first]
categories: []
date: 2025-12-04T22:42:00-05:00
draft: false
---

As the saying goes there is no cloud, just someone else’s computer. Simplistic as it is, the saying captures a universally accepted reality: app data is better off hosted elsewhere living on someone else’s hardware (I’m looking at you GCP and AWS). The issue with this cloud-first sentiment is that it relegates the cloud as a panacea. Sure, giving control to the cloud frees us from the burden of bootstrapping infrastructure and managing complex ops, but it comes with its own set of tradeoffs. Chief among them? The total loss of control over our own data. Not to mention the added reliance on third-party uptime (looking right at you us-east-1).

Local-first challenges this notion by putting the onus on the device as the primary source of truth. It doesn’t discount the role of the cloud. In this model, the cloud is the cache. Instead of its standard role as authoritative source, it is now responsible for handling sync, backups and coordination across peers. While data continues to live on a device, the cloud serves as a conduit for synchronizing changes across devices and sessions. 

Take the example of a real-time collaborative app like Figma, which lets users share a design document and contribute to it simultaneously. An intermediary server is what connects user sessions together. Without it, users would have no way to propagate changes to one another and there would be no real-time capability. This is of course assuming they are neither physically on the same local network nor using an actual peer-to-peer setup with signals and relays. Servers here serve as “cloud peers”. They store copies of the app state and forward it to other peers that connect to it. 

Git and GitHub is another perfect example of the ideal local-first model. Git fully works offline, and gives users complete control over their commit history. GitHub serves as a platform for collaboration while providing a managed backup and archive to restore history from. Here, the principle of cloud-as-cache is clear; we maintain data autonomy while still benefitting from the durability of a centralized archive, since devices will inevitably fail at some point.

Local-first doesn’t force us to reject the cloud in the name of data autonomy and privacy. On the contrary, it pushes us to rethink our relation to the cloud. With the cloud as a back up cache and the device as the main source of truth, we get the best of both worlds; local autonomy and cloud reliability. Cloud and device, ever the twain shall meet, in perfect sync.