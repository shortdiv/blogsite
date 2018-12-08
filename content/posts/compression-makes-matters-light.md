---
title: "Compression Makes Matters Light"
description: "A dive into compression algorithms available when building for the web"
tags: [performance, advent, frontend]
categories: [performance, advent, frontend]
date: 2018-12-07T18:56:43-06:00
draft: false
---

Content compression is one of the simplest and most effective means to improving webpage performance. A smaller file size means lighter page load and faster download speeds, which translates to lightning fast page renders. For some, if not most of us developers, content compression is a black box that we don’t have to give much though to. Compression mechanisms automagically work by default in browsers and servers. And if you’re loading pages via a CDN like Netlify, chances are you will **_never_** have to think about compression since they compress your files for you ✨ . Regardless, having a basic understanding of compression strategies can be a handy tool to add to your toolbox, especially in the event when you have to configure your own origin servers.

## But first…

Before we begin, let’s cover some basics of content compression and how it applies to the web. Content compression is the basic process of shrinking a file without a significant loss to the information contained in the file. Compression can be of 2 main types; lossy and lossless. Lossless compression is a data compression algorithm that allow original data to be encoded and decoded without any loss to the data; the data is identical pre and post compression. On the other hand, lossy compression is a data compression algorithm that uses approximations in its encoding and decoding which results in data being discarded; the data is not identical pre and post compression. While you don’t have to understand the algorithmic internals of how compression works, it is useful to note that data compression algorithms today are built on the notion of probability. Algorithms have to make accurate predictions and measure how much data is encoded in a message. This measurement of the number of bits needed to represent a message is known as Entropy.

A mental model to better visualize how data compression algorithms work is to think of the 2 sentences (thanks to [Raul Fraile](https://www.youtube.com/watch?v=wLx5OGxOYUc) for this metaphor):

1. It’s currently 21°F in Chicago
2. It’s currently 21°F in San Francisco

Chicago is no stranger to cold weather—as they say, just another tuesday in Chicago—so the above sentence contains no additional useful information. The sentence can therefore be compressed down quite significantly. Comparatively, San Francisco never experiences bitingly cold winters. As a result, the second sentence is newsworthy (yay global warming) and can’t be compressed down because of how useful the information it contains is.

## The real deflate gate.

By far, the most popular compression technique implemented on the web is known as deflate, which is a lossless compression algorithm based on Huffman coding and LZ77 compression. Deflate in turn powers zlib, and gzip, the latter of which is a format commonly referred to in conversations pertaining to compression and web performance.

To learn more about the intricacies of these algorithms check out http://www.zlib.net/feldspar.html.

### Gzip

Gzip is the most popular and effective compression method on the web. [According to this very legit article on CSS Tricks](https://css-tricks.com/snippets/htaccess/active-gzip-compression/), using gzip can reduce file sizes by up to 70%. The basic principle of the gzip algorithm is to find matching strings and compress them. A high number of matching strings mean that a file can compress more. This makes files like HTML, CSS and JS prime candidates for gzip as they often contain matching tags, white space and new lines which can be compressed out to make smaller files. To see gzip in action, check out [Julia Evans’ incredible demo video](https://www.youtube.com/watch?v=SWBkneyTyPU); [“gzip + poetry = awesome.”](https://www.youtube.com/watch?v=SWBkneyTyPU), where she demonstrates the basics of how gzip works.

### Zopfli

Zopfli is a lesser known compression algorithm that is, like gzip, also compatible with deflate. Compared to gzip, zopfli brings added compression benefits (around 4-8% smaller file size), albeit at the expense of compression speed. As a result of added optimizations in the zopfli algorithm, compression is about 100 times slower compared to gzip and other zlib standards. Zopfli is therefore unsuitable for compressing and decompressing data on the fly and is more adapted to dealing with images and other such binary blobs that change infrequently.

### Brotli

Brotli is the newest, open source compression algorithm developed by Google that was designed specifically for text compression. Compared to gzip and zopfli, brotli boasts a far more superior compression ratio (according to a Google study, Brotli came out with a **20-26% increase in compression ratio** compared to Zopli.). Though this, like zopfli, comes at a severe cost to compression speed. It is therefore optimized more for static compression, when assets are compressed on the disk ahead of the user's request rather than for dynamic compression, when assets are compressed on the fly when a user requests it. Because of how resource intensive Brotli compression is, it has yet to see much CDN support—Netlify for one doesn’t support brotli yet 😞 and [Fastly kinda sorta supports it](https://community.fastly.com/t/brotli-compression-support/578/6). Even so, as the fastest compression strategy that is also future compatible with the next generation of browsers, Brotli adoption will likely increase over the next few years. For a real world use case of performance boosts Brotli brings, check out [this case study by LinkedIn](https://engineering.linkedin.com/blog/2017/05/boosting-site-speed-using-brotli-compression), [this one from Cloudflare](https://blog.cloudflare.com/results-experimenting-brotli/) and [this CSS Tricks article](https://css-tricks.com/brotli-static-compression/).

## Now what?

When making decisions about the best compression strategy to go with, it is worthy to consider your use case for compression. Are your pages delivered dynamically, like in the case of JavaScript heavy applications or Single Page Applications (SPAs) or are they more “static” pages that change infrequently. The need to deliver pages faster may also determine the level (1-9, with 9 having the highest compression) at which you set your compression. Whichever compression algorithm you choose, they all should yield some noticeable performance benefit.
