---
title: "Dont Lose the Plot"
description: ""
tags: [ai]
categories: []
date: 2026-03-20T15:13:19-04:00
draft: false
---

The other day, I was working on translating data from a file into json to visualize the results. Easy enough, given that this was an operation I’d done countless times in the past. Still, I blanked. After spending months delegating all coding related tasks to an agent, I’d completely lost the muscle memory of a simple `fs.readFileSync` call. I ended up sheepishly reaching for Claude, which wrote the function in more time than past me would have taken.

By no means am I an AI hater. Claude Code is my daily driver and I’ve experimented with coding orchestrator tools like Conductor to run agents in parallel and further optimize my workflow. It’s pretty clear that the days of writing code by hand are well behind us. What’s more alarming is how easy it’s becoming to delegate tasks to an agent. With a tool like Claude, we’re encouraged to “Keep Thinking” and to treat it like a collaborator. But agents offer a clear path of least resistance, and humans have always taken the “easy” path when available. I don’t mean to say this as a moral failing. Instead, my observation is about what we lose when the friction to create is low.

I was never someone who enjoyed writing code. In fact, I found it tedious. To me, code was my chosen language to solve problems. But the years spent grinding through languages and frameworks to build what I wanted exposed me to concepts that gave me a sense of what “good code” is. Elixir taught me about building fault tolerant systems. Go taught me patterns for building highly concurrent programs. Kubernetes manifests gave me an understanding of orchestrating systems. As I learned a new tool, I was building a mental model of how to build systems that scale, fail and recover.

In the AI era, we refer to this sense of knowing as “taste”. A seemingly hand-wavy term to pat ourselves on the back for the decades of experience those of us have from working in the pre-AI world. But taste is really about judgement. Judgement is built by practice. Agents are good at writing code, and we should let them. But give it the autonomy to think for you and you’re on the fast track to learned helplessness—and poor taste.

What I’m leaving out is that effort comes with failure. And it’s much easier to blame failure on an agent than take on the blame yourself. I’d argue that the real learning and judgement happens in being wrong often. In maths class, you got credit for “showing your work” even if the answer was wrong. When it comes to working with agents, staying present in the work keeps you engaged and builds resilience. No matter what, this is what will matter in the long run. But if you repeatedly outsource your attempts, you’ll never learn what wrong feels like. Or worse, you’ll forget entirely. And that’s precisely what taste is: the knowing when something feels off.
