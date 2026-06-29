---
title: "Ship fast, think later"
description: "How coding agents changed the way I onboard and why shipping faster doesn't always mean understanding more"
tags: []
categories: [ai]
date: 2026-06-29T17:27:04-04:00
draft: false
---

I started freelancing this year. This has meant jumping between unfamiliar codebases and getting productive as quickly as possible. A year ago this process entailed scouring through READMEs and directly pairing with a more veteran engineer to further familiarize myself with the codebase. Today, the process couldn’t be more different. I prompt an agent to walk me through general architecture, set up my local build environments and I’m often opening a PR within the first few hours of work. 

Undoubtedly, agents have made me dramatically more productive. But I've noticed that my understanding just barely keeps pace with my code contributions. By the time I've wrapped my head around one part of the system, my agent has already implemented a feature in another part of the stack. 

Writing code by hand was how I used to learn. Sure, there was some copy/pasta from Stack Overflow now and again but the process of implementation was a forcing function to understanding; especially since I had to explain my code in a PR and respond to feedback and suggestions from other contributors on the team. With agents, learning has become optional. Sure, I still respond to comments, but it’s become so easy to ship without fully internalizing how and why things work that I sometimes catch myself doing just that.

This is the conundrum I keep finding myself in time and again with each new project. Agents have made it trivial for me to ship code but this speed comes at a cost. My work feels less honest. Not because it’s necessarily worse—though I’ve definitely written some slop—but because my code comprehension has often lagged behind my output. As a freelancer this is a really uncomfortable position to be in. Assumedly, clients pay me for my expertise and good judgement, which all rely on understanding how things work. But if my understanding starts to consistently lag behind my output, it’s a wonder if I’m providing value in the first place. 

I say all this not as someone nostalgic for the pre-agent days. On the contrary. But I do believe that we need to be more intentional with the learning process that used to organically happen during onboarding.

Lately, I've been experimenting with adding friction back into my process. Instead of jumping straight into implementation, I’ll timebox an agent-assisted onboarding session to ~40 minutes, limit it to the scope of my work (i.e. observability/networking) and have the agent quiz me on my understanding before starting on any actual work. This forces me to slow down and properly synthesize the scope of my work so I can more meaningfully contribute. I’ve also restricted agents from opening PRs on my behalf. This way I have to explain the contribution in my own words. I sometimes even add screenshots and record a walk through (if the workflow makes sense) so the purpose of the contribution remains clear. 

None of these solutions are a panacea. But they’re the tiny ways in which I’ve tried to make sure my understanding keeps pace with my contributions. If agents make implementation effortless, then learning is no longer a happy side effect. It has to become a deliberate way in which we work.