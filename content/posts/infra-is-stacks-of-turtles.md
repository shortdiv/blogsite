---
title: "Infra is stacks of turtles"
description: ""
tags: [advent]
categories: []
date: 2025-12-22T21:21:36-05:00
draft: false
---

In Pulumi, stacks can separate an infrastructure build by environment or by more granular concern. In a recent setup I worked on, we went with the latter approach. One stack handled compute, another handled networking and a third managed global artifacts like container images. Given that Pulumi stacks are all about independent interoperable units, the stack differentiation helped us reason about our infrastructure as separate areas of concern. Until it didn’t. 

While rebuilding our stack after what felt like the umpteenth time, my ecs cluster deployment would fail after hanging in limbo for about a good half hour. The culprit? An ACM certificate that was stuck in `PENDING_VALIDATION`. On the surface, it didn’t make sense, the Route53 record for the domain existed, it was created in the networking stack. And the validation record existed, it was created via ACM in the compute stack. What I didn’t realize until further digging was that the zone never updated with the NS records created in ACM. The networking stack created the Route53 zone, and the compute stack created the ACM certificate, which generated validation records that needed to go into that zone. But since the zone was created in isolation, ACM didn’t have access to it to update the certificate with the records that it needed to validate ACM. The certificate depended on the zone existing. The zone needed to be updated after the certificate was created. Neither stack could do both.

By separating Route53 records (networking stack) from the cluster and ACM certificate (compute stack), we'd created a circular dependency. Each stack depended on the other. The assumption of a Pulumi stack is that they are independent. Ours weren't even though we’d intended for them to be. We eventually landed on moving the route 53 record creation into the compute stack alongside ACM config, thereby letting the main compute stack handle validation records directly. After all, we'd unlikely rebuild this stack once it had been created.

This conundrum left me questioning the overall premise; does a separation of concerns (at least the ones represented via Pulumi stacks) map to how infrastructure works irl. Can infrastructure components be truly defined as cleanly and independently as we’d like? 