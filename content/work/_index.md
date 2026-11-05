---
title: "Work"
layout: "work"
hideMeta: true
disableShare: true
ShowToc: false
description: "Case studies from freelance work with early-stage teams, and the roles before that."
heading: "Recent work"
lede: >-
  Early-stage teams I've worked with across go-to-market, observability, and developer
  tools for AI.
cta:
  label: "Work with me"
  url: "/hire/"
# Case studies are the pages in this folder (one file per client, ordered by weight).
# Past roles below: name, role, company on the row; description and links when expanded.
projects:
  - name: "Jazz.tools"
    role: "Infra"
    company: "a local-first database & sync engine"
    period: "2025"
    icon: "/icons/work/jazz.png"
    tags: ["o11y", "platform"]
    description:
      - >-
        I designed and built a centralized OTel Collector that intercepts telemetry before it
        leaves the cluster. Splitting data by type let us filter and sanitize metrics before
        sending them to Grafana. It became the foundation the team used for usage-based billing.
    related: ["/posts/the-journey-to-otel-collector"]
  - name: "Fly.io"
    role: "Platform & DevEx"
    company: "a multi-region PaaS on Firecracker microVMs"
    # TODO(div): rough dates, e.g. "2022–2024".
    period: ""
    icon: "/icons/work/fly.png"
    tags: ["platform", "devops"]
    description:
      - >-
        I built the v1 devex for Fly Machines, including a scheduling primitive for machine
        workloads and visibility into machine health in the kernel init process. The work
        spanned CLI, API, and dashboard, in Go, Rust, and Elixir.
    links:
      - label: "Scheduled Machines"
        url: "https://community.fly.io/t/new-feature-scheduled-machines/7398"
      - label: "Swap usage in app metrics"
        url: "https://community.fly.io/t/swap-usage-data-is-now-available-in-the-app-metrics-dashboard/13449"
      - label: "Reading memory pressure"
        url: "https://community.fly.io/t/identifying-memory-pressure-in-fly-metrics/12624"
      - label: "Deploy provenance for GitHub Actions"
        url: "https://community.fly.io/t/connecting-github-actions-to-a-fly-deploy/15639"
  - name: "Netlify"
    role: "DevRel & edge platform"
    company: "a Git-based deploy platform & edge CDN"
    # TODO(div): rough dates, e.g. "2018–2021".
    period: ""
    icon: "/icons/work/netlify.svg"
    tags: ["devex"]
    description:
      - >-
        I championed the JAMstack through talks, demos, and technical blog posts. I was also embedded on
        the platform team to rebuild the CDN edge logic and the redirects engine.
    links:
      - label: "Redirects Playground"
        url: "https://redirects-playground.netlify.app"
    related: ["/posts/redirect-rulez"]
closing: >-
  Working on something like this? Email me at **hello[at]shortdiv[dot]com**.
---
