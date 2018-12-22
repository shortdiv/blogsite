---
title: "Finding the Right Voice Ui"
description: ""
tags: [future, advent, frontend]
categories: [future, advent, frontend]
date: 2018-12-22T15:46:21-06:00
draft: false
---

One of the most memorable cinematic portrayals of a voice recognition system is Hal 9000, the seemingly omniscient computer from Stanley Kubrick’s 2001: A Space Odyssey. Hal captured our collective imaginations and opened our eyes to the possible future of a voice based human-computer interaction. Since the movie’s release in 1966, the landscape of voice recognition systems have changed drastically. According a study done by Adobe Analytics over 32% of US consumers own a smart speaker and that number is expected to increase nearly twofold by the end of the year. The emergence of integrated digital assistants like Amazon’s Alexa and Google’s Google Home has also meant that voice is now being used beyond just playing music and checking the weather forecast. With the increased reliance on voice as a medium of interacting with the web, designers and developers are now faced with a new challenge: designing interfaces optimized for voice-based interactions.

![https://assets.pcmag.com/media/images/606625-voice-activities-expand.png](https://assets.pcmag.com/media/images/606625-voice-activities-expand.png?thumb=y&width=980&height=887)

## From GUI to VUI

Designing for voice-based interactions requires a significant re-thinking of the typical user experience. Admittedly, we are still in the early days of voice, and there is no tried and true strategy to what makes for an optimal voice-based experience. Regardless, the fundamental principles of user-centered design remain applicable and can be adapted to fit the needs of a Voice UI (VUI). For one, the user is of utmost concern in both Graphical User Interfaces (GUI) and VUI and interfaces must account for how users interact with the input device whether that be a keyboard or a voice command.

“Just because voice interaction is a relatively new technology doesn’t mean the fundamentals of user-centered design don’t apply.”
– Kathryn Whitenton, The Most Important Design Principles of Voice UX

## Build trust between human and machine

When building for VUI, its worth considering that a voice based workflow moves in one direction—forwards—and there is often no easy way for a user to back out of a query. Current implementations of speech to text are fairly naïve and puts the onus on the user to ask the right question. Users themselves expect to be understood and get exactly what they requested. This disconnect between the expectations of the user and the machine can be a cause for frustration and lead to a reduced level of trust in the system (by the user of course). To tackle this, designers and developers can build guard rails into their applications to guide users to asking the right questions and implement helpers so machines can better guess what a user really means.

### Better algorithms

While the accuracy of speech recognition systems have vastly improved over the last decade, speech to text performance still performs worse compared to a human’s ability to interpret text. Human speech often involves a heavy use of context, and relationships, among many other patterns all of which are hard to codify. Even so, since natural language processing (NLP) and understanding (NLU) rely on training models to improve, it’s only a matter of time before machines outperform humans in this regard. To ensure our applications perform at the highest possible accuracy of speech to text recognition, we can easily take advantage of the more sophisticated algorithms available. One such algorithm is the Levenshtein Distance, which is also known as the minimum edit distance. The Levenshtein Distance effectively represents the number of changes necessary to change one string to another. It works by taking two different strings and counting the number of steps it takes to make the two strings match.

### Train the user

Another way to ensure optimal success in VUI is to train the user to ask the right question. As we covered in the earlier section, users are often wordy and verbose. They may also use verbiage and phrases unfamiliar to a computer. To address this, a VUI can repeat the user’s sentence with some modifications. For instance, when a user asks to “turn on the tv”, the VUI may repeat the query like “put on the tv?”. Repeating user queries with slight modifications, trains the user to use language best understood by the UI. This builds on the idea that users when engaged in a conversation respond in kind. They adopt terminology and sometimes even the mannerisms of the other party to be better accepted and understood.

## The Future of Voice

There are many strategies for building better VUI experiences, all of which differ based on the use case of the application (i.e. search, directions) and the type of user using it (a user with a speech impediment or a non native speaker). When building VUI it’s therefore crucial to consider the user and their needs first and consider that the main goal of an effective VUI here is of course to maximize the chances of getting the right result to the user as quickly and efficiently as possible. We’re only on the cusp of what’s possible with VUI and there is a lot more happening within the space of voice. Exciting times lie ahead of us.
