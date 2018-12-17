---
title: "Aria Ready"
description: ""
tags: [accessibility, advent, frontend]
categories: [accessibility, advent, frontend]
date: 2018-12-16T21:32:16-06:00
draft: falses
---

As a user without disabilities, I often take for granted the experience of using the web. Browsing and interacting with the web often involves reading visual cues to decipher the general purpose of a particular element. For one, sighted users of the web know that the (now infamous) hamburger icon that sits at the top left of the screen is representative of a clickable menu item. Such assumptions and relationships that we make between icons and their meaning are largely a result of context clues. We understand that a hamburger icon is a menu item because of its placement in the top navigation bar, which we use to “navigate” a webpage. For visually impaired users, such clues may go completely unnoticed depending on how a screen reader interprets a webpage. This is especially the case when elements are given no additional meaning that can be deciphered and prioritized by a screen reader (i.e. a button is just a button to a screen reader even if it is styled to be a menu button). This is where ARIA comes in.

## Have you met ARIA?

ARIA or more formally known as WAI-ARIA, which stands for for “Web Accessibility Initiative - Accessible Rich Internet Applications”, is a suite of web standards to make web content and applications more accessible to people with disabilities. It is mostly built with the purpose of helping assistive devices like screen readers parse information on the web. By adding meaning and significance to content online, ARIA has become an essential means by which visually impaired users navigate the web.

In addition to its role in assisting user interaction, ARIA also helps with prioritizing information on the page. Sighted users are often able to quickly navigate through a web page by scanning over it to get a general landscape of the page’s layout. ARIA extends this ability to visually impaired users via “Landmark roles”, which are specifically classified and labelled sections of a page (annotated by a developer of course). These roles allow structural information to be represented programmatically, so users regardless of physical ability can identify the overall structure of a page similarly. They also provide screen readers with the context to skip unimportant details like hyperlinks to make sense of the noise online.

## Getting to know ARIA

When used well, ARIA is a powerful framework for identifying features for user interaction, as well as for providing context to understand the current state and relationships of an application. A poor use of ARIA however, can lead to an unpleasant and incredibly frustrating non-visual user experience that may even be worse compared to a case when ARIA wasn’t used in the first place. To understand how to use ARIA appropriately it is best to first get a conceptual understanding of how screen readers parse information on a web page.

### ARIA climbs the a11y tree

Much like how the DOM parses HTML to build a DOM tree and the CSS to build a CSSOM tree, it also generates an accessibility tree hierarchy of content. An accessibility tree is information exposed to a web browser through accessibility APIs, which assistive technologies like a screen reader use. Functionally, it removes unimportant information like meta and script tags to expose the barebones of a functional webpage and prioritizes content based on any additional information provided by a developer. Notably, this tree that the browser builds is optimized for keyboard usage. When navigating the tree via a keyboard, a user is able to locate where they are based on which node of the tree is focused. Because the accessibility tree is built with not only ARIA labels but with the help of markup and styles, it is imperative for developers to ensure that their markup is semantic and doesn’t unnecessarily confuse screen readers. One example of this is to ensure that there is a visual distinction between selected items and an item that is currently in focus. For more on the accessibility tree and to explore how a webpage looks like as an accessibility tree, check out Leonie Watson’s [excellent post on the accessibility API](https://www.smashingmagazine.com/2015/03/web-accessibility-with-accessibility-api/) and [Marcy Sutton’s gist](https://gist.github.com/marcysutton/0a42f815878c159517a55e6652e3b23a) on experimenting with Chrome’s accessibility developer tools.

### ARIA goes Label Picking

As we’ve seen so far, ARIA helps us modify and sometimes even augment the organization of a webpage so it becomes clearer and easier to navigate. A key way in which it does this is via roles properties and states.

- **Roles**

Earlier in the post, we mentioned “Landmark roles”, which are attributes on an element which enable screen readers to identify the overall structure of a webpage. These are part of an overall categorization of roles which denote characteristics and properties of an element. Roles in ARIA consist of four main categories, abstract roles, widget roles, document structure roles and landmark roles. While you don’t have to remember the exhaustive list of when/where to use a specific subcategory of roles, it’s worth noting that a role is used to identify a characteristic of an element. You can learn more about the specificity of roles in the [W3C docs here](https://www.w3.org/WAI/PF/aria/roles).

- **Properties**

ARIA properties generally refer to attributes that are unlikely to change with user interaction. Compared to roles, properties add an extra granularity so elements can be identified for their individual properties instead of being reduced to the generic classification (i.e. button). An example of such a property is the `aria-popup=true`, which tells the screen reader specifically that that element has an added popup attached to it.

- **States**

States, like properties provide specific information about an element. The main difference is that states, as the name suggests captures any changes to an element regardless of their frequency. On a webpage, change is often illustrated visually. This can be difficult for screen readers to pick up on. For instance when a popup layover takes over a page, a screen reader might not notice this change and read content behind the popup, thereby confusing non visual users. A good example of state is the ` aria-hidden=``"``true``" ` property that allows for toggling a content’s visibility to screen readers.

## All systems are ARIA GO

ARIA is an incredibly handy standard that offers developers clear guidance on making their content more accessible to non visual users. While it is definitely not an exhaustive fix-all solution, its ability to enhance our application and give it richer meaning without an incredible amount of effort makes it an accessible means of reaching most of our accessibility goals in a pinch.
