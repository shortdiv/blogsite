---
title: "Superstylin With A11y in Mind"
description: ""
tags: [accessibility, advent, frontend]
categories: [accessibility, advent, frontend]
date: 2018-12-17T20:26:28-06:00
draft: false
---

When building for the web and making considerations for accessibility, it is easy to fall into the trap of assuming that accessible features only benefit disabled users. While disabled users positively benefit from accessibly designed interfaces, there are many other reasons why a user may similarly leverage keyboard shortcuts or specialized software to navigate websites. For instance, an otherwise able-bodied user may be forced to use assistive technologies as a result of an injury or a recent surgery that make it difficult to navigate a website as they ordinarily would. A user may also choose to use such assistive technologies purely out of personal preference because it allows them to navigate a site quickly and efficiently. It is therefore important for us as developers to build online experiences that don’t discriminate against how a website is accessed.

A significant way in which we can do this is by optimizing the styles of our webpages (via CSS) to help distinguish the overall organization of content and prioritize key information. CSS provides us with fine grained control over how elements are positioned on a page. Though screen readers generally order content based on how it appears in the DOM, any stylistic changes made to the visibility or focus may impact how a screen reader interprets content. This can consequently have drastic effects on a user’s experience, especially if important content or state conditions (such as focus) is hidden from a screen reader.

When building universally accessible webpages, it may seem daunting to account for the many situations and contexts in which a user accesses a page. For starters, let’s focus on some common interactions and user settings to account for, namely tabbing, zooming, and changing screen contrast modes.

## Focus on the tab

The `TAB` key is instrumental in enabling keyboard only users to navigate a webpage. It moves the user through the page from one focusable element to another and allows the user to do a quick scan to decipher its general layout. As a result, focus styles are critical for visually displaying the currently selected element on a page. Without a focus marker to indicate where on the page you are, a user tabbing through a webpage will likely struggle to locate their place on a page. In spite of the importance of focus styles to tab-based interactions, they are often discarded because of how they look. As the earlier point indicates, this is generally bad practice because removing focus styles renders your website virtually inaccessible to keyboard-only users. A better approach to removing focus styles is to replace default focus styles with custom ones so the page remains accessible. Another handy tip is to use the shiny new `:focus-visible` CSS pseudo-class so that focus styles are only applied to elements when they receive keyboard focus. At the moment, browser support for `:focus-visible` isn’t the greatest. Buuuuuut Sarah Souiedan offered a great solution to this in her [amazing talk on Building Inclusive Experiences](https://vimeo.com/296790813) at Smashing Conf NYC. This solution ensures that there will always be focus styles in situations regardless of whether or now a browser supports the new pseudo class.

    button:focus{
      /* fancy focus styles for everyone */
    }
    button:focus:not(:focus-visible) {
      /* undo all the focus styles for mouse users */
    }
    button(:focus-visible) {
      /* some focus styles for keyboard users only */
    }

## Come on and Zoom

Zooming in on text is a common adjustment users who are hard of sight or who have a reading difficulty like dyslexia make so that webpages are easier to read. This adjustment however often breaks the overall layout of a page, making it difficult to decipher content. Though enlarging text via zoom is largely taken care of by the browser, developers can optimize their layouts to account for this adjustment. Responsive design is one aspect in which this can be taken into account. A responsive layout adapts a site to a device size via breakpoints and can therefore help users who require magnification by breaking the site into organized chunks of information. Variable fonts are another exciting new CSS feature that gives the user control over how a font is displayed. In the past the browser (and the developer) had full control over how a font was presented. With variable fonts, a user can change the weight, width, slant, italicization, slant and optical size to make text more easily readable without having to rely solely on zooming a page—Generally, readers read better when good typography practices (alignment, spacing, etc.) are followed.

## Trust in Contrast

Most designs provide some form of contrast between text and background that makes content legible. This contrast however, may not always be sufficient for users with low vision or for users trying to browse a webpage under the relentless glare of the sun. Contrast is broadly defined as the difference between two colors that makes the two distinguishable from one another. Improving the contrast on a webpage isn’t rocket science. It often involves making sure there is a minimum contrast ratio ([as defined by the Web Accessibility Initiative](https://www.w3.org/WAI/test-evaluate/preliminary/#contrast)) to ensure that contrast between text and background is high enough for low vision users to read. Chrome (as of Chrome 65) now provides a [contrast ratio in the color picker of developer tools](https://developers.google.com/web/updates/2018/01/devtools#contrast) so you can check to make sure your sites are accessible to users with low-vision impairments or color-vision deficiencies. Contrast is not just a browser feature however. Operating systems are now starting to introduce contrast settings to give users the flexibility over how they browse content online. Windows 7 introduced a high contrast mode, that is accessible via CSS styles `-ms-high-contrast` media query. Mac has also introduced dark mode in its recent mojave release that browsers can target via the `prefers-color-scheme` media query. This gives developers much more control over how their interfaces look depending on the user’s display preferences. For more on optimizing for dark mode on a mac, and high contrast mode in windows, check out [Andy Clarke’s recent post](https://stuffandnonsense.co.uk/blog/redesigning-your-product-and-website-for-dark-mode) and [Sara Soueidan’s talk at Smashing Conf NYC](https://vimeo.com/296790813) respectively.

## A11y in style

As a developer building a webpage, it’s important to consider that controlling how a specific type of user interacts and views a webpage is a futile effort. Not only does it lead to user frustration when their expectations are not met (visual content not matching screen reader content), it can also lead to surprising side effects and unexpected behaviors that can be hard to manage. As developers we should aspire to instead build pages that are flexible to bend and flex to user customizations. With this ethos of building webpages, we can ensure that all users get a similar experience online while also making sure our pages are adaptable and sustainable in the long term.
