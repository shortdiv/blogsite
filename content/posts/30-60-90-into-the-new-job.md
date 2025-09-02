---
title: "30/60/90 into the new job"
description: ""
tags: [personal]
categories: []
date: 2025-09-02T10:45:06-04:00
draft: false
---

I’ve been pretty quiet about my work life lately. But spoiler alert, I have a job (and have been at it for the last 3 months)!

If you spoke to me earlier this year or read a previous post about my job search, you’d have heard that the journey to a job post layoff for me was an emotional rollercoaster. Interviewing was not a strength of mine. I spent months getting wooed by companies impressed by my resume only to get rejected after yet another failed technical. It was horrifyingly depressing. But just as I was starting to lose steam, I got my break and landed a dream role, in the most unexpected (but unsurprising) of ways—in person, at a conference.

I first met the team at Local-First conference in Berlin. Their team was small but incredibly passionate and I found myself gravitating towards their booth throughout the course of the conference to chat about startups, product, infra and localfirst software. Within the first day of the conference, I managed to pair with a few folks on the team to build and deploy my first app built using their framework. So when the founder and founding engineers sat me down to offer me a job, it was hard for me to decline—though I had to handle some logistical issues before finally accepting.

And so, here I am 90 days into my role at [Jazz](jazz.tools), a startup building a local-first database and I couldn’t be more—jazzed. My role here is unlike any other I’ve had in the past. I get full autonomy over how we build systems which makes me responsible for any successes and failures we have; an exciting and terrifying thought. The upside to all this is that there’s so much room for growth. I’m moving fast and breaking so many things but learning at breakneck speed. Here’s a quick look at what I’ve done so far:

## 30 days: Familiarizing myself with the infra beast
In my first few weeks, I dove deep into our infrastructure, from Nomad and cloud providers to the way we handle ingress. I hit a few bumps—like taking down ingress for a few hours on week 1 thanks to a broken Caddy config—but those mistakes accelerated my learning and helped me quickly understand how the system worked end to end.

## 60 days: Cooking with infra tools
Once I got familiar with the systems, my first big task was building an OpenTelemetry collector to gather metrics from our internal jobs and ship them to Grafana. Along the way, I dove deep into observability, Grafana, and the quirks of port forwarding between Docker and Nomad. After a couple of iterations, I deployed a working otel pipeline in production, complete with dashboards to monitor it. I also improved our CI pipeline by adding config validation and testing before deploys, mostly for my own sanity, to prevent future ingress hiccups.

## 90 days: Taming the infra beast
With the basic foundations in place, I moved on to tackling a larger project with longer term impact. This entailed updating how we manage cloud-init and provision new instances and introducing a more robust way to grow our infrastructure. In this process, I dove deep into Pulumi, infrastructure provisioning, and monitoring and I’m continuing to build on that trajectory.

It’s been a whirlwind 90 days — I’m breaking things, fixing them, and learning at a pace I’ve never experienced before. Most days, I feel way out of my depth, stumbling through failures, and questioning if I’ll ever feel competent and wondering if today will be the day I finally get fired—yet somehow I manage to keep pulling through. Each time, I come out a little sharper; a reminder that I’m better today than I was a week ago, and tomorrow I’ll be even better, even if I can’t see it yet.
