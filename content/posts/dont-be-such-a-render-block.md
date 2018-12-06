---
title: "Dont Be Such a Render Block"
description: ""
tags: [performance, advent, frontend]
categories: [performance, advent, frontend]
date: 2018-12-05T19:02:43-06:00
draft: false
---

In previous posts, we talked about optimizing our websites to reduce page weight and inadvertently decrease overall page load time. This page load metric, though incredibly important, doesn’t fully take into account the user’s perception of a websites’ performance. At the very least, a user’s goal when visiting a website is to view the page content. As a result, they are more likely attuned to the time it takes for a page to be viewable ([first meaningful paint](https://www.quora.com/What-does-First-Meaningful-Paint-mean-in-Web-Performance)) or usable (time to interactive) rather than on the time it takes for the entire page to load (page load time). Optimizing for render performance requires a sound understanding of the steps the browser takes when going from initial page request to rendering pixels to the screen.

![progressive page rendering](https://developers.google.com/web/fundamentals/performance/critical-rendering-path/images/progressive-rendering.png)

## Mission Critical: Render all the things.

The process that the browser takes from request to _initial_ render is known as the critical rendering path. To better understand how this process works, let’s break this down into smaller steps:

![Path to Render](https://d2mxuefqeaa7sj.cloudfront.net/s_78F08FDC4C38FA0FC7F69435F258A828CF3F1A7E25C938B8E9C4991EDB17B6A6_1544050666902_Screen+Shot+2018-12-05+at+4.57.21+PM.png)

When you first go to view a page, the browser sends a request for the main `index.html` page, which it then parses to build a Document Object Model (DOM) tree. This is what will allow the browser to capture the basic structure of the webpage. In the midst of parsing the HTML, the browser encounters additional resources, namely the CSS file, which it then goes to fetch and subsequently parse to build a (CSS Object Model) CSSOM. In addition to CSS files, the browser will also likely encounter JavaScript as it parses the HTML document. Whenever this happens, the browser will pause the parsing process in order to finish executing the script; because JavaScript can affect both HTML and CSS, it takes precedence when encountered during the initial parsing phase. Upon completion of parsing and with the the newly constructed DOM tree and CSSOM, the browser now attaches the styles to the various DOM nodes to produce a **render tree**. The render tree is the blueprint that the browser uses to compute the layout of elements and paint pixels to the screen.

![Building a Render Tree](https://d2mxuefqeaa7sj.cloudfront.net/s_78F08FDC4C38FA0FC7F69435F258A828CF3F1A7E25C938B8E9C4991EDB17B6A6_1544051419029_Screen+Shot+2018-12-05+at+5.02.59+PM.png)

In the construction of the render tree, we can already see the crucial roles that HTML, CSS and JavaScript play. Theses three elements can therefore be assumed to be render blocking since they delay the time to first render on the page.

## Clearing the critical performance hurdle

By now we can conclude that we have to somehow optimize our HTML, CSS and JavaScript in order to improve the perceived performance to the user. An obvious solution to increasing performance is to reduce file size; Smaller files mean less things to load. While this may be a perfectly cromulent solution, reducing file size doesn’t take into account the most important resources the page needs for initial render. For one, we need to analyze the critical render path of our page and identify the most important resources it needs for a successful paint. With this knowledge, we can then prioritize these resources and defer or maybe eliminate non mission critical resources so that they only load at the end.

TL;DR steps

1. Identify critical resources
2. Prioritize critical resources by making them first to load
3. Defer/Async everything else

**Critical CSS**
In the explainer for the browser render path earlier, we saw that a request for CSS blocks the page from rendering. Thankfully, there’s a sneaky way to minimize the set of render blocking CSS (critical CSS) so only the most important styles load on initial render. Determining the critical CSS for a page however can be rather complex. It requires knowledge of the elements that a user will see on initial render as well as the associated styles for those elements. Doing this manually would prove a tedious endeavor. But lucky for us there are many tools to help us deliver mission critical CSS without much added effort. [Penthouse](https://github.com/pocketjoso/penthouse) is one example of those tools that enable you to identify critical CSS. For more on critical css, I recommend this [humorous tutorial](https://www.youtube.com/watch?v=Ay2uty18TFA) by the dynamic duo David and MPJ on Dev Tips.

**Inline some of the things**
If you desire your resources to be non render blocking as much as possible, your best bet is to inline them. Inlining is often seen as bad practice in the development world—and with good reason. In excess, inlining can thwart the benefits that one less network request brings since the browser still needs to take time to parse and execute the desired CSS and JavaScript. In order to maximize the performance gains from inlining your resources, use is sparingly. And if you’re dealing with CSS use it in tandem with tools like Penthouse so you end up only inlining CSS that actually matters.

**Async/Defer JavaScript**
With the ubiquitous presence of JavaScript on our webpages, it comes as no surprise that JavaScript has a huge impact on performance. As we discussed previously, a browser stops rendering the page when it encounters and subsequently executes JavaScript. One way to tackle when and how JavaScript gets executed is to utilize the async and defer HTML attributes. Async gives the browser permission to load the script in the background without blocking render. On successful download of the file, the browser then stops rendering to execute the file. Defer works similarly to Async with the exception that it only executes JavaScript filed in the order specified. A script lower down in the document will therefore be deferred from loading even if it finished loading before a script at the top of the document. For more on using `async` and `defer`, check out [this blog post](https://unused-css.com/blog/how-javascripts-async-and-defer-tags-let-you-load-pages-faster/) as well as [this one](https://bitsofco.de/async-vs-defer/) that goes in depth into the scenarios and performance benefits of using on over the other.

## Browsers + Developers = Better Performance

Ensuring that a website loads as fast as possible takes a lot of work from both the developer and the browser. While browser engines (and the people who make them) do a great job of making sure our websites are as performant as possible by default, there are many tools and techniques at our disposal (see above) to making more performant webpages. Its our responsibility as developers to deliver better experiences for our users everywhere. So go forth and make more performant websites!
