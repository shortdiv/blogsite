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
# Shown on the page: name, area, summary (clients); name, role, company (projects).
# The longer fields below aren't rendered yet; kept for per-case-study pages later.
clients:
  - name: "Stealth (YC)"
    # Client is in stealth: no name or logo, just the YC mark. Don't add customer names
    # or product details that would identify them.
    icon: "/icons/work/yc.png"
    iconAlt: "Y Combinator"
    area: "Go-to-market"
    summary: "Modeled MRR, usage, and billing backward from revenue targets, and turned it into an actionable launch GTM plan with a clear timeline and tasks."
    tags: ["growth", "gtm"]
    oneLiner: >-
      A YC-backed devtools startup, currently in stealth. I modeled usage, billing, and
      revenue, and turned their revenue targets into a growth plan.
    problem: >-
      The team had revenue targets and a launch coming up, and needed a plan for how to hit
      them.
    did:
      - "Modeled usage and billing, and built an MRR model (base revenue, expansion, overages, new logos, churn) worked backward from revenue targets."
      - "Built a top-of-funnel model from waitlist signup through first connection and sustained usage."
      - "Turned both into a launch and post-launch GTM plan: pricing comms, onboarding, case studies, distribution, and reactivation."
      - "Set up customer research and usage analytics (cohorts, churn signals) to find activation and reactivation opportunities."
    # TODO(div): one result (rough number or before/after).
    result: ""
    stack: ["PostHog"]
    related: []
    # TODO(div): testimonial, e.g. { quote: "...", author: "Name, Title" }.
    testimonial: {}
  - name: "LM Studio"
    icon: "/icons/work/lmstudio.png"
    area: "Observability"
    summary: "Expanded the observability stack with Cloudflare Workers Analytics Engine and a custom dashboard, so the team finds and fixes production issues before customers report them."
    tags: ["o11y", "enablement"]
    oneLiner: >-
      LM Studio is a desktop app for running LLMs locally. I expanded their observability
      stack so the team could see errors and error rates.
    problem: >-
      The team needed better visibility into errors and error rates, and wanted to catch
      production issues before customers reported them.
    did:
      - "Expanded the observability stack with Cloudflare Workers Analytics Engine."
      - "Built a custom dashboard for errors and error rates."
      - "Worked with the team to speed up how they find and fix production issues."
    # TODO(div): one result (rough number or before/after).
    result: ""
    stack: ["Cloudflare Workers Analytics Engine"]
    related: ["/posts/the-journey-to-otel-collector"]
    # TODO(div): testimonial.
    testimonial: {}
  - name: "Tero"
    icon: "/icons/work/tero.svg"
    area: "Developer tools for AI"
    summary: "Built the original CLI for finding and fixing telemetry waste, on a Zig policy engine, so engineers can see which logs are waste and drop them in Datadog."
    tags: ["devtools", "cli"]
    oneLiner: >-
      Tero helps engineering teams find and cut telemetry waste. I built the original CLI
      experience for it.
    problem: >-
      Engineers needed a clear way to see which logs were waste so they could act on it.
    did:
      - "Built the original CLI interface and end-to-end flow on top of a Zig policy engine."
      - "Designed the end-to-end flow that shows engineers which logs are tagged as waste, so they can drop them in Datadog."
    # TODO(div): one result (rough number or before/after). Not Tero's marketing numbers.
    result: ""
    # TODO(div): stack, if any is worth listing.
    stack: []
    related: []
    # TODO(div): testimonial.
    testimonial: {}
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
