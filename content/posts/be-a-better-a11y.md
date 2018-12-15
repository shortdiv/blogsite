---
title: "Be a Better A11y"
description: ""
tags: [accessibility, advent, frontend]
categories: [accessibility, advent, frontend]
date: 2018-12-15T10:00:41-06:00
draft: false
---

# Being a better A11Y

It’s almost impossible to think of the world without the web. Compared to other inventions of yore, the web is the single most powerful medium of communication. Through its promise of openness, freedom and independence, the web levelled the playing field. It gave everyone the chance to transcend the limitations of their physical condition regardless of their level of ability. In spite of this promise of inclusivity, the web's potential as a "global community" was never truly realized. Most of the internet today is a maelstrom of inaccessible iframes, popups and captionless gifs that are near impossible to parse via a screen reader or the tab key.

## Why be an A11Y

The web has become a ubiquitous means of communicating with the world. Not only do we use it for social media and sharing cat videos, we also rely on it to access healthcare, employment and many government services like welfare. With this increased reliance on the web to meet our basic needs, it becomes imperative for the web to provide equal access and opportunity to all. While you may argue that only websites that provide such crucial services should be held accountable to accessibility standards, a largely inaccessible web makes disabled users (and those who may need access to such services) less likely to go online altogether. According to a Pew Research Survey done in 2016, disabled Americans are 3 times as likely than those without a disability (23% vs 8%) to never go online.

It's worth noting here the term "less likely" when considering the above sentence from the Pew Research Survey. Though disabled users are not as motivated to use the internet because of the slew of obstacles one must overcome to browse the web, disabled users **still** use the internet. It definitely takes a lot of bravado and gumption to use the web as a disabled user today. But it doesn't have to be and shouldn't be this way. We owe it to our fellow netizens (is this a word people still use?) to do better. If you're still not convinced, go read my friend Callum Macrae's impassioned article on ["The Case for Accessibility"](http://macr.ae/article/case-for-accessibility.html)

## Down the a11y

When we consider how to build for accessibility it's important to note that disability comes in many forms. There are four main categories of disabilities that affect users on the web, namely Visual, Auditory, Motor and Cognitive. In her post ["Why Bother with Accessibility?"](https://24ways.org/2013/why-bother-with-accessibility/), Laura Kalbag highlights these categories in detail:

- Visual

  Blindness, low vision and colour-blindness

- Auditory

  Profoundly deaf and hard of hearing

- Motor

  The inability to use a mouse, slow response time, limited fine motor control

- Cognitive

  Learning difficulties, distractibility, the inability to focus on large amounts of information

### Read the WCAG

To make building for these disability categories actionable,the W3C's Web Content Accessibility working group has put out a series of recommendations and guidelines in the [Web Content Accessibility Guidelines](https://www.w3.org/TR/WCAG21/) document. These guidelines are sorted by four main goals—to make the web perceivable, operable, understandable, and robust. In addition, the WCAG also offers recommendations on levels of conformance so developers can build up to accessibility in a strategic fashion. You can read more about that in the [section on conformity](https://www.w3.org/TR/WCAG21/#conformance). For an abridged cliffnotes version of the WCAG, check out Alan Dalton's [recent post](https://24ways.org/2018/wcag-for-people-who-havent-read-the-update/) on 24ways.org.

### Do the research

If you've never understood what the user experience of a disabled user is online, try accessing the web without a mouse or with a screen reader—Callum has [a really great post](http://12devsofxmas.co.uk/2016/01/day-8-testing-using-a-screen-reader/) on how to test using a screen reader if this is new to you. You'll be surprised by how frustrating this experience is. You can even go one step further and seek out users with disabilities. In doing this, be clear of the goals and intentions of your user testing session. InVision recently wrote a really [in depth blogpost](https://www.invisionapp.com/inside-design/accessibility-user-testing/) on how to get started with accessibility testing that's worth a read.

### Testing, Testing

Another way to incorporate accessibility into your development is to use automated tools like [aXe-Core](https://www.deque.com/axe/) and the [Wave Toolbar](http://wave.webaim.org/extension/). These tools highlight accessibility snafus in your projects and allow you to target the lowest common denominator of accessibility concerns with as little effort as possible.

## A11y for a truly open web

Realistically speaking, making accessibility a commonly held priority means making the path to accessibility as smooth as possible. To build accessibly doesn't have to mean shifting priorities completely. You can work up to it by gradually incorporating accessibility steps like user testing and automated testing into your workflows so accessibility becomes a first class citizen. The web is an incredible medium that enables us to connect with others without being held back by the limits of physical borders, language barriers, and cultural differences. In keeping with this goal of an open web, it becomes our collective duty to make sure the web remains truly open and accessible.
