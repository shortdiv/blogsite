---
title: "Infra Has an Intent Problem"
description: ""
tags: []
categories: [ai, infra]
date: 2026-03-24T10:14:13-04:00
draft: false
---

In a past job, I broke networking within my first week of starting. The change? A single line commit that added a customer domain to a reverse proxy control loop that directed traffic to a specific server.

```
api.somecompany.com, api.anotherfancynewcompany.ai {
  reverse_proxy http://localhost:4200
}
```

At a glance, this code is legible, it *should* work; we’re manually proxying traffic from two domains to a locally running instance. A passing caddy validate run further verifies this. 

But the underlying assumptions are what make this work. Specifically:

- Both domains are correctly configured in DNS
- The service at `localhost:4200` is reachable from where Caddy is running. 

Neither of these is visible from the code snippet.

If either of those assumptions doesn’t hold, Caddy fails in a way that implicates the wrong thing and you end up looking in the wrong places to debug. Sure, DNS is not Caddy’s concern, and debugging poorly is a skills issue. But this is exactly my point: There is an unspoken bias in the platform space, *that you just have to know how stuff works.*

In an agentic world, where models seemingly get smarter by the day, the answer might be “just throw an agent at it”. The problem though is the agent might not have the domain expertise that you do. And when agents don’t know, they don’t infer, they guess.

The instinct here is to add guardrails like access controls and approval gates to prevent an agent from running potentially destructive changes. But that just treats the symptom. The agent isn’t the issue, illegibility is. Infrastructure is bad at explaining itself. We’ve often papered over this by hiring the types of people who *just know* and our tools reflect that. But agents don’t just know. And we should never assume that the next model will be fine-tuned enough to internalize the “tribal knowledge” embedded in custom configuration.

If we are to fully hand over the keys of our infrastructure to an agent, we need to be explicit about what we want our infrastructure to accomplish. We need a better way of translating intent. For an agent to operate infrastructure reliably, it doesn’t just need access to all the right tools and context—though that definitely helps. It also needs to understand the reasoning behind the topology and the assumptions that must hold true for it all to work. Until we have a way of encoding that without causing the agent undue confusion, we’re expecting understanding and intuition where we’ve only enabled pretty decent recall.