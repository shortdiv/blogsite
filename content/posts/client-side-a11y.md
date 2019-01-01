---
title: "Client Side A11y"
description: ""
tags: [accessibility, advent, frontend]
categories: [accessibility, advent, frontend]
date: 2018-12-18T20:22:14-06:00
draft: false
---

With the rise in popularity of client side, JavaScript frameworks like React, Vue and Angular, it is undeniable that JavaScript is eating the web. This increased reliance on JavaScript isn’t necessarily a bad thing. JavaScript enables us to add interactivity to a page and thereby create more engaging user experiences online. It has also helped address many performance issues with its solutions relating to lazy load and client-side routing via the history API. JavaScript however, is also a notorious cause of many accessibility issues. For instance, client side routing while enabling navigation without a full page reload, [doesn’t get picked up accurately by screen readers](https://medium.com/@robdel12/single-page-apps-routers-are-broken-255daa310cf). In addition, click and hover only events make apps virtually unusable for keyboard only users. To better understand the role of JavaScript with regards to these accessibility issues, let’s more closely examine how assistive devices are used to navigate the web.

## Assistive Tech to the rescue!

Next to the mouse, keyboards are one of the most commonly used input controls when navigating the web. In addition to able-bodied “power” users, many with motor disabilities or any type of muscular impairments rely on a keyboard of some form for navigation. Of the keys on a keyboard, the `tab`, `enter`, `spacebar` and respective arrow keys— `→` `↑` `↓` `←`—are standard keystrokes used for interaction. More specifically, the `tab` key is used to navigate through links and form controls, the `enter` (and also `spacebar`) key is used to select an element and the arrow keys are used for general navigation. Because every key is used in such a specific manner, interactions via the keyboard should be predictable. Many applications unsurprisingly fall short of this expectation. Common pitfalls include issues relating to focus management and navigation order. (If you’re interested in learning more about how keyboard users use their keyboards, check out [this WebAIM article](https://webaim.org/techniques/keyboard/))

Another commonly used assistive device is the screen reader. This tool is often used in conjunction with a keyboard and converts digital text into synthesized speech to help users with low vision or cognitive disabilities use the web. Though the web is chock full of content, screen readers generally condense this information into meaningful chunks (read: accessibility tree) so that users can quickly scan and consume content online. Like keyboard-only navigation, screen readers too face similar issues like focus management. In fact, screen readers may reveal an even more jarring user experience when navigating pages online. As we mentioned earlier, dynamic content changes and DOM updates made via JavaScript are not easily picked up by screen readers and can cause confusion for non visual users of the web.

## Where do we go from here?

Though JavaScript has historically been a hindrance to accessibility, its presence doesn’t make an application inaccessible by default. Applications are inaccessible because they were built without any considerations for alternate input controls and assistive technologies. Instead of blaming JavaScript for all our problems ([true life: my name is JavaScript](https://en.wikipedia.org/wiki/True_Life)), a better approach is to use the functionality JavaScript gives us to boost the state of accessibility on the web. One way to do this is by implementing best practices and strategies into our JavaScript workflows. In order to better align these strategies with our accessibility goals, lets focus on solutions to the core accessibility challenges highlighted earlier; focus management, and accurately reflecting dynamic content changes.

### Focus Management

When an element on the web has “focus”, it means that it can be manipulated and activated either via a keyboard or other alternative input controls. It almost goes without saying, but focus is handy for keeping track of where you are on a page. For most sighted users, this focus is noticeable visually via the default browser outline focus style (if it hasn’t already been removed) and/or by the position of the cursor. One way to tackle focus management in applications is to direct your users down a logical navigation path via focus order.

Focus order is the navigational sequence in which a keyboard user accesses elements on a page in an order that makes sense. For example, if we were to have a menu which has submenu items, only the menu needs to be focused since it can be assumed that a menu has subcategories within it. The best strategy to achieve this is to add a tabindex attribute to top-level interactive elements. The general practice for using tabindex is to set the value to 0 or -1, depending on whether or not you want an element to receive focus (0 for focus, -1 for no focus). Another strategy is to make use of “focus trapping”. Focus trapping is the concept of literally trapping focus in an element context i.e. a modal so anything outside that element cannot be directly accessed. This is of course a fairly advanced technique for focus management so use it with caution. For more on focus management, check out this [Smashing article by Kushagra Gour](https://css-tricks.com/a-css-approach-to-trap-focus-inside-of-an-element/).

### Dynamic Content Updates

In JavaScript power applications, especially Single Page Applications, dynamic content changes is considered a feature. Doing away with page refreshes and server round trips has brought about immense performance gains. However, these “improvements” have been made with little regard for where a keyboard is currently focused. Unexpected dynamic content updates can result in a completely unusable experience as such users literally lose focus with these updates. To make these updates more inclusive, a good strategy is to update non visual users of these changes as they happen. This can be achieved by creating visually hidden text to which messages can be sent from events to inform a user of changes happening on screen. Doing so gives non visual users much needed context around the state of applications so they have a better sense of an application’s behavior. To keep non visual users informed of state, you can also utilize `aria-live`, which is a browser supported mechanism that screen readers can use to subscribe to changes in the DOM. Essentially, when an element is rendered, any new text appended via JavaScript will be read out by the screen reader. Since most applications are pretty dynamic and changes happen fast and frequently, you can control the timing of the `aria-live` attribute via a politeness setting. For more on this, [MDN has a pretty comprehensive doc on using it.](https://developer.mozilla.org/en-US/docs/Web/Accessibility/ARIA/ARIA_Live_Regions)

## JavaScript + a11y = more usable web

Client side applications are not inherently inaccessible. Their role in yielding inaccessible content is largely a result of whether or not accessibility was considered in the development process. While the techniques discussed here are by no means exhaustive, they are hopefully a good starting point to start building more accessible client side applications.