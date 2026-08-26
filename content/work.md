---
title: "Work"
layout: "work"
hideMeta: true
disableShare: true
ShowToc: false
description: "Selected work in developer tools and infrastructure."
intro: >-
  I have a deep intuition around developer tools — PaaS to managed databases, APIs to
  CLIs — and how one interface decision echoes through the stack. I build end to end
  (the full full stack, as I like to call it), bringing product thinking to platform work.
projects:
  - name: "Jazz.tools"
    icon: "/icons/work/jazz.png"
    tags: ["o11y", "platform"]
    description:
      - >-
        Jazz is a local-first database that enables durable data in your app. The
        cluster comprised a network of nodes that shipped telemetry straight to
        Grafana Cloud on a hardcoded token; the core node which was the one in the critical path, had no observability of its own.
      - >-
        I designed and built a centralized OTel Collector that intercepts telemetry before it leaves the cluster. Data was split by type which allowed metrics to be filtered, sanitized and sent through to Grafana. It became the foundation the team used for usage-based billing.
  - name: "Fly.io"
    icon: "/icons/work/fly.png"
    tags: ["platform", "devops"]
    description:
      - >-
        Fly is a platform that transmogrifies Docker containers into globally running
        micro-VMs. While the platform was robust, the developer experience left much to
        be desired.
      - >-
        I built the v1 devex for Fly Machines. This
        effort included a scheduling primitive for machine workloads, and visibility
        into machine health in the kernel init process. This work spanned CLI, API, and
        dashboard, written in Go, Rust, and Elixir.
    links:
      - label: "Scheduled Machines"
        url: "https://community.fly.io/t/new-feature-scheduled-machines/7398"
      - label: "Swap usage in app metrics"
        url: "https://community.fly.io/t/swap-usage-data-is-now-available.../13449"
      - label: "Reading memory pressure"
        url: "https://community.fly.io/t/identifying-memory-pressure-in-fly-metrics/12624"
      - label: "Deploy provenance for GitHub Actions"
        url: "https://community.fly.io/t/connecting-github-actions-to-a-fly-deploy/15639"
  - name: "Netlify"
    icon: "/icons/work/netlify.svg"
    tags: ["devex"]
    description:
      - >-
        Netlify is a platform for building, deploying, and scaling modern web apps. I
        joined as the second hire to the devrel/devex team and focused on improving
        platform adoption.
      - >-
        I championed the JAMstack, advocating for reserving app logic to the client without deep
        coupling to a backend server, through talks, demos and technical blogposts. I was also embedded on the platform team to rebuild the CDN edge logic and the redirects engine.
    links:
      - label: "Redirects Playground"
        url: "https://redirects-playground.netlify.app"
sinceThenText: >-
  I've been doing fulltime contract work working with early-stage teams in AI operations and developer platforms. 
availability: "Available for new contract work this fall."
closing: >-
  Reach me at hello[at]shortdiv[dot]com.
---
