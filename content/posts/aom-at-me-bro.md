---
title: "AOM at Me Bro, I've seen the future of a11y"
description: ""
tags: [accessibility, advent, frontend]
categories: [accessibility, advent, frontend]
date: 2018-12-19T17:33:19-06:00
draft: false
---

[Earlier this week](https://shortdiv.com/posts/aria-ready/), we briefly examined the concept of an accessibility tree, which represents the information model—much like the DOM—that assistive devices use to parse and make sense of a webpage. Unlike the DOM tree which can be queried and modified after the fact via JavaScript APIs, the accessibility tree can only be queried but not modified by assistive technologies. In an increasingly JavaScript heavy web ecosystem, input events like click and hover drive interactivity. Interactions are tailor made to suit specific input controls, so a hover event may open up help text, while changing focus states by clicking away may trigger form validation. These specific mappings between input controls and actions add a layer of fine grained control to the overall user experience. While alternate input controls have access to similar interactions, they still have to rely on DOM updates since they is no way to directly access the accessibility tree.

![Image showing how the the web browser simultaneously paints the visual UI and also updates the accessibility tree.](https://wicg.github.io/aom/images/DOM-a11y-tree.png)

## AOM

Thankfully, there is a [current spec](https://wicg.github.io/aom/spec/) in the WICG for an Accessibility Object Model that aims to create a declarative JavaScript API so developers can directly modify the accessibility tree. ✨ The spec is a collaborative effort between the main browser vendors Google, Apple and Mozilla and will combine the best ideas from the APIs that they independently proposed. Current plans for rollout of this new API are split into 4 main phases, each of which represents a portion of the features to be introduced.

### Phase 1: Accessible Properties

In the first phase, current accessibility semantics like aria attributes will be made accessible to JavaScript. At the moment, developers can only modify ARIA attributes via the native semantics of HTML elements. For instance, changing the role of an element requires using `setAttribute`, which can be verbose and error-prone.

```JS
el.setAttribute("role", "button");
```

In the new API, updating ARIA attributes will be baked into the current web API, so that they are accurately reflected in the HTML elements. This property will also be available to the `shadowRoot` interface so custom elements have access to them.

```JS
el.role = 'button'
```

### Phase 2: User Action Events

The second phase will address handling input events triggered specifically by assistive technologies. This will enable a user to interact with a page through alternate input controls like voice command. Currently, there is only partial browser support for interacting with native HTML elements via accessible actions. A developer can, for example, implement scrolling for assistive device via the `scrollIntoView` method. However, this stopgap solution doesn’t give you the full control of handling a semantic event via a web API. Moreover the current API doesn’t yet account for fairly common actions like dismiss for exiting dialogues or increment/decrement for moving a slider. User action events will address these challenges by providing specific event listeners like `actionDecrement`, `actionIncrement` and `actionDismiss`.

Admittedly, the browser needs to be aware that the input device is using assistive technology to take advantage of this new API. This can be problematic to users who choose not to disclose their disability to the browser. To account for the privacy of these users, a new user permission dialogue will be triggered before an AOM event listener is fully captured. This way, users have the choice to disclose their current status to the browser in real time.

### Phase 3: Virtual Accessibility Nodes

Phase 3 of the spec will introduce the concept of virtually accessible nodes, so developers can modify the semantics of nodes in the accessibility tree. These virtual accessibility nodes are not associated directly with any DOM element and will only be available to assistive technologies. As a result, developers have more granular control over the accessibility of custom APIs. One compelling use case for this is canvas elements. In the current browser implementation, canvas elements, which are used to power complex WebGL components are inaccessible because there is no standard way to mark up content in a canvas object. With virtual nodes, developers can now express content available in canvas by building parent/child relationships with other virtual nodes to denote their position and dimension. 🤯

### Phase 4: Computed Accessibility Tree

The last phase of the spec will introduce a computed accessibility tree API. Through this, developers gain full access and control of the accessibility tree and can interact with it declaratively. (Finally!) By directly querying and manipulating the accessibility tree, developers can properly check if an accessibility property was successfully applied; At the moment, there is no way to do this except by manual trial and testing.

```JS
let computed = await getComputedAccessibleNode(myListItem);
computed.role; // listitem
```

This is useful not only as a way to prevent errors but also as a way to check for feature detection in browsers. With a computed tree structure developers can enhance our tests so that the semantics of an element are accurately asserted beyond just checking for the accuracy of a string. Access to the accessibility tree also means more control over how the tree is structured and updated which translates to a better user experience for assistive device users.

## The power of AOM

The proposal for an Accessibility Object Model is an incredibly exciting new development with the potential to revolutionize the world of accessibility. With the introduction of accessibility features into the JavaScript API, developers will hopefully find it much easier to build interfaces that work across all kinds on input controls. A low level API will also mean that developers no longer have to switch contexts when building for accessibility and may even allow for the development of new and interesting interfaces that are optimized for assistive devices. The future of accessibility is bright. If you’re keen to learn more about the spec, check it out on [GitHub](https://paper.dropbox.com/doc/AOM-at-me-bro--AUAYMlz3XvcyaNsDVRcNkAIlAg-EgUJtsQSr5rIwbrQAARVS#configure-embed). [Stefan Judis](https://twitter.com/stefanjudis) also gave a great brief introduction to it in the [State of Accessibility chat](https://youtu.be/aoyLG2gTFpI?t=2768) with [This Dot media](https://www.thisdot.co/this-js).
