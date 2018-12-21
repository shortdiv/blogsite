---
title: "A Picture Is Worth the Thousand Words"
description: ""
tags: [aaccessibility, advent, frontend]
categories: [accessibility, advent, frontend]
date: 2018-12-20T18:25:13-06:00
draft: false
---

For most of us, the web is a magical world of media rich content like images, gifs and most importantly, cat videos. Images, however humorous, are the primary means of maintaining user engagement online. Unfortunately, for many users with disabilities and/or other impairments, this rich visual heavy experience of the web remains inaccessible. Assistive devices like screen readers and refreshable braille displays can only interpret text and rely on developers adding `alt-text` or captions to make sense of images. Though this type of content is hard to parse, low vision users should not be predisposed to a text only web experience. For one, not all low vision users are blind. Many, like sighted users, can benefit from the added semantic meaning that images and video provide. As a result, as developers it is important to account for the range of abilities and adjust our media content appropriately.

## Alternative Text for Images

A common strategy for ensuring that images are accessible on the web is to add `alt-text` to them. `alt-text` provides a textual alternative to image and media content so assistive devices can interpret images for visually impaired users. They also give low vision users access to the image rich experience online, so they can now be a part of popular social media platforms like Instagram and Facebook. Despite this importance of `alt-text`, there is no clear standard for adding them to an image. You don’t have to look far to find examples of poorly defined `alt-text` on the web. When used poorly and incorrectly, `alt-text` can cause a jarring experience and be worse compared to a situation where `alt-text` hadn’t been used in the first place. To rectify this problem WebAIM.org recommends being deliberate when adding `alt-text` to an image. More specifically, `alt-text` for an image should embody the content and function of the image. If an image is used as a diagram accompanying text, the `alt-text` can summarize the general meaning of the diagram and show how it validates a statement or hypothesis made in the actual text content. Moreover, the meaning and significance of an image can be enhanced using captions or text adjacent to an image. A general rule of thumb when adding alt-text is to be accurate (remember, convey content + function), be succinct and to the point and not be redundant by adding “an image of” or “a graphic of” or information that was already in the text accompanying the image.

## Long Descriptions

While `alt-text` is handy for helping non-visual users make sense of images, their succinctness means that they can only convey limited information. This can be problematic for more complex images on the web, which contain more substantial information that cannot be meaningfully truncated. Examples of these images include maps, diagrams and illustrations that add a visual context to information on a page. In cases like these, alternative content can be presented in an adjacent data table to add additional information and context to an image. In a recent “State of the Images” report by HTTP Archive, an adjacent data table not only adds context to the graph but offers non visual users access to data that they can parse to get a better sense of the graph.

![Graph with adjacent data table from State of Images on HTTP Archive](https://d2mxuefqeaa7sj.cloudfront.net/s_6AECF4BB7DF3E5A9CB95F6B0703275CBCB24E6412B24C2BA5440CE09745D63D8_1545350075499_Screen+Shot+2018-12-20+at+5.53.47+PM.png)

Another way to make complex images more accessible is to link them to a separate page containing a longer description. The `longdesc` attribute can be used to denote the URI of the separate web page that has a longer description of an image. In spite of its usefulness, current support for `longdesc` varies widely across browsers and assistive devices and is therefore not reliable. Because of this, it is generally recommended to accompany `longdesc` with an adjacent text link. To better associate this text link with the image, lean on HTML5 attributes like `figure` and `figcaption` to group images and links semantically. For more on this, check out the [W3C recommendations for complex images](https://www.w3.org/WAI/tutorials/images/complex/#a-text-link-to-the-long-description-adjacent-to-the-image).

## Color and Contrast

Another way in which we can make images more accessible to users of all abilities is to consider the role of color in conveying the meaning on an image. In many cases, color is used as the primary means of communicating an image’s purpose. The first graph below taken from the State of Images report on the HTTP Archive for instance, relies completely on color to differentiate between desktop and mobile image usage. For a user with achromatopsia or total color blindness, the graph as is is hard to make sense of (see second graph).

![Graph of image byte usage in desktop vs mobile by HTTP Archive](https://d2mxuefqeaa7sj.cloudfront.net/s_6AECF4BB7DF3E5A9CB95F6B0703275CBCB24E6412B24C2BA5440CE09745D63D8_1545347945544_Screen+Shot+2018-12-20+at+5.18.40+PM.png)

![Same graph but in monochrome.](https://d2mxuefqeaa7sj.cloudfront.net/s_6AECF4BB7DF3E5A9CB95F6B0703275CBCB24E6412B24C2BA5440CE09745D63D8_1545348505692_Screen+Shot+2018-12-20+at+5.28.05+PM.png)

To make graphs better to parse, it’s best to not rely heavily on color to convey meaning. Instead, use an easily distinguishable feature like patterns (bold vs dotted lines) or symbols in addition to color to make a point so every user can understand the significance of that image.

## Images for Everyone

Though we have made many strides with improving accessibility on the web, the web remains a difficult medium to navigate for many low vision users. This is especially the case because of the increased use of images online. Though adding additional meaning and context to images can seem like an arduous, if maybe gargantuan, task, it is critical for us as developers to make towards improving the experience of our fellow users online.
