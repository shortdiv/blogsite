---
title: "You might not need an orchestrator"
description: ""
tags: [advent]
categories: []
date: 2025-12-17T22:59:11-05:00
draft: false
---

Across the startups that I’ve worked at, a recurring theme has been using Nomad and eventually migrating off of it. In one of them, [which you might already be fairly acquainted with](https://fly.io/blog/carving-the-scheduler-out-of-our-orchestrator/), Nomad was an initial iteration at constraint-based deployments enabling regional rollouts and seamless rescheduling across a fleet during maintenance events. For a company like Fly.io that gives customers the ability to schedule apps in different regions, an orchestrator is fundamental to the user experience. That said, many companies (at least several that I’ve worked at) rely on orchestrators like Nomad for deployments. In these instances, Nomad is overkill and often complicate the deployment experience.

The key observation here is that orchestrators solve a specific kind of problem. If an app needs global scheduling, constraint enforcement and automatic node rebalancing, it’s the perfect solution. But for many apps, these features aren’t necessary. Let’s take the example of a web service with cross-regional nodes in Frankfurt, São Paulo, Sydney and Singapore. Though we want our service to always be available in all 4 regions, running an orchestrator adds weight to the deployment model. If one node fails, the entire cluster suffers from degraded performance unless a failover node is in place. Moreover, with Nomad, we don’t have fine-grained control or visibility over region-level placement ([unless you use federated clusters](https://developer.hashicorp.com/nomad/docs/architecture/cluster/federation)). This is especially apparent if your configuration looks something like this:

```hcl
job "service" {
  region     = "global"
  datacenters = ["*"]

  group "service" {
    count = 4

    constraint {
      attribute = "${node.class}"
      value     = "service-mesh"
    }

    update {
      max_parallel     = 2
      min_healthy_time = "10s"
      healthy_deadline = "5m"
      auto_revert      = true
      auto_promote     = false
    }

    restart {
      attempts = 3
      delay    = "10s"
      interval = "1m"
      mode     = "delay"
    }
  }
}
```

In this scenario, the node restart logic retries the failed node 3 times with a 10s delay between attempts. Until the node comes back online or another one can replace it, Nomad marks the entire cluster as “degraded”. This clearly highlights how orchestrator managed retries can get in the way of failure recovery if you don’t already have some external mechanism to handle node failures.

A simpler approach is to create a region-aware deployment pipeline, especially when a failover region is not in place. With a tool like Pulumi, you can declaratively define the regions and deployment scripts in code. Something like:

```ts
import * as pulumi from "@pulumi/pulumi";
import * as docker from "@pulumi/docker";
import * as aws from "@pulumi/aws";

const regions = ["sa-east-1", "eu-central-1", "ap-southeast-1", "ap-southeast-2"];

regions.forEach(region => {
    // create the instance
    const instance = new aws.ec2.Instance(`web-${region}`, {
        ami: "ami-12345678",
        instanceType: "t2.micro",
        tags: { Name: `web-service-${region}` },
    });

    // create the image
    const image = new docker.Image(`web-service-${region}`, {
        build: "./app",
        imageName: `myorg/web-service:${region}`,
    });

    // deploy the image on the ec2 instance
    const deploy = new pulumi.command.remote.Command(`deploy-${region}`, {
        connection: {
            host: instance.publicIp,
            user: "ec2-user",
            privateKey: process.env.SSH_KEY,
        },
        create: pulumi.interpolate`docker run -d -p 80:80 ${image.imageName}`,
    });
});
```

This is of course heavily simplified and assumes the web service runs in a docker container. Here, Pulumi provisions the infra and runs commands to deploy the service giving you direct control over where containers run and how they’re updated. Without a scheduler however, the service stays down when a node fails. This is the tradeoff for simplicity. The risk here can be easily mitigated with some basic health checks and automated redeploy scripts. Sure, it’s more work than simply throwing the entire deployment into a Nomad file and calling it a day. But I’d argue that the effort is worth your while. Investing some time into a robust deploy script with basic health checks and redeploy/failover logic beats having to manually decrement the node count and deploy the change—trust me on this one.

At the end of the day, orchestrators are powerful, but they’re not always necessary. Sometimes the path with some upfront complexity is the more reliable way to ship that will save you time and effort in the long run. And of course, if you really must, you can always throw an orchestrator on later.
