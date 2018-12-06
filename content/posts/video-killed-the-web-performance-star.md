---
title: "Video Killed the Web Performance Star"
description: ""
tags: [performance, advent, frontend]
categories: [performance, advent, frontend]
date: 2018-12-03T21:06:38-06:00
draft: false
---

Video is one of the most sought out mediums on the web and is used widely in web page designs today. [According to a Cisco report](https://www.cisco.com/c/en/us/solutions/collateral/service-provider/visual-networking-index-vni/white-paper-c11-741490.html), video constitutes the majority of the world’s internet traffic. In 2017, video was reported to have constituted 75% of all internet traffic and this number is slated to surpass 80% by 2022. This should come as no surprise to most of use, considering the fact that video content is a powerful medium for visual communication and offers a great way to keep users engaged. Adding video to websites however, can oftentimes be a double-edged sword; We may make some gains via a richer, more delightful user experience but risk performance issues if our websites are not optimized appropriately. This, alongside the rapid growth of traffic originating from mobile and wireless connections means we as developers are increasingly responsible for optimizing our sites for performance. In this post, we’ll dive into video optimization strategies so we can reap the benefits video provides without driving users away.

## Is Video the problem?

_“Video is not a big issue for page loading, since in general video shouldn’t be part of the cost of loading a web page._

Generally, video plays a tiny part in an overall page load and is hardly the cause of most web performance bottlenecks. Even so, video can have an impact on overall user experience, especially when it comes to playback. Think of the frustration you feel when the Netflix playback stalls when you try to seek or replay a video from a specific timestamp. Optimizing video content is therefore less about overall page load and more about hitting the optimal playback. To get a better idea of what this means, let’s dive in to the anatomy of a video file and what goes into the process of streaming a video.

## Anatomy of a Video

MP4 (H.264/MPEG4) is the standard of video content online, and boasts widespread browser support. These files consist of lots of encoded data known as _atoms._ Atoms are self-contained data units containing information about the video file such as timescale, duration and any additional display characteristics. Of the different types of atoms in a video—[there are many](https://www.adobe.com/devnet/video/articles/mp4_movie_atom.html)—the most important atom is the moov atom. The moov atom acts as an index, or a table of contents for video data. The location of this atom determines how the program will play or scrub the video. As a result, the file will not play until the player gets access to this index.

The best case scenario for optimal playback is to position the moov atom at the beginning of the file. Doing so would mean that the browser doesn’t have to download the entire video or bits of the video in order to locate the moov atom.

## The one atom to rule them all

At this point, we’ve established that the positioning of an moov atom determines the speed and quality of a video’s playback. But assuming that a single video contains potentially thousands, and even millions of atoms, how are we supposed to find the moov atom? Thankfully, the work of locating and positioning the atom is handled by most, if not all, video encoding software. Software such as [Handbrake](https://handbrake.fr/) has a _“Web Optimized” or “Optimize for Web” or “Fast Start”_ option, which places the `moov` atom at the start of the file. Running a video file through _ffmpeg_ is another tool we can use to position the moov atom at the beginning of the file. Here’s an example script you can run to convert an mp4 file courtesy of [this excellent blog post by Boris Schapira](https://blog.dareboost.com/en/2018/01/optimize-your-mp4-video-for-better-performance/)

    ffmpeg -i origin.mp4 -acodec copy -vcodec copy -movflags faststart fast_start.mp4

Note that the `-movflags faststart` parameter is what ensures the movement of the index (moov atom) to the beginning of the file.

## Is your page Ready?

Optimizing your video file is one way of ensuring that your video doesn’t significantly impact the performance of your pages. To ensure a good, buttery smooth user experience however, your webpage should be optimized to support video content. One strategy to prepare your pages for video is to prevent autoplay, or defer autoplay as much as possible. Earlier, we talked about how video doesn’t really affect a page load. This is usually the case unless your video is in autoplay mode. In autoplay mode, videos occupy a large portion of bandwidth thereby reducing bandwidth for other assets. If you absolutely must autoplay a video, a good practice is to defer loading the video until after the initial page load so video content doesn’t have to fight with other assets for bandwidth.

Another way to optimize your page containing video is to prioritize for mobile users. Since a large and growing proportion of web traffic is made over a mobile network connection, optimizing for bandwidth usage becomes much more of a pressing concern. In order to save mobile users bandwidth, we can choose not to load video on mobile devices via a simple media query. The [Net Info API](https://www.w3.org/TR/netinfo-api/) is also a means to query a device’s network connection and load assets accordingly. As exciting as this API may be, current browser support is dismal, though this may change in the near future ([Colin Bendell at Cloudinary secretly announced their implementation fo the Net Info API at Vue Toronto](https://lh3.googleusercontent.com/NzCITZXHybeYEmXqL7T1L9Mv6B8bOENxc3QHf3TxIxeljMeo4J37viLvTOZEgzubFIdIWtAH1gn82DRP09m6_g9YFYOv2gy2ndbGQJ4DYKy6ixs2X2y7Q5jPqn3Na1XM4n_aNJceYoxAXR-v3VodL89AUgGavWxhMQIcJ8AzzbZ-FBnNcfr59ufvW53cYQWPjYYjx3VnLn3WRET3pdsYzzCRN1glwCy0y13tqNjn3WQpK0DQnljQ0cAE8sbQW_yB380p449eapsS2_GsvUjkfOvz9mvD84_GBWdq0ReSnIP8yL9DFctJxYabdDoDuFeWbKSCOZBfS77LRWxZLE2PN75Qg5HgDE1IwA6dXLSUqNxh1p4P-jM0ZcJhPkxUiNAucNON4bC-a4KIchgNbyKtpkLBDzAdQuDjVdr3gTOPoE7Vy5DPknuMPD_fqVQjlu6-sWNdjh4i0nCMej_cImWfDIyunqfvSfSmdQluimxAE0EqLy6lXuevsmDbEQYSGEBjuiPfgoI_dmyqYqHeYoOCPFWyZC1bsL-mCapCygvTH3mo2Avfag7KxmR4gZBNbj48CFNSRMKfiMRCUtN0rtXE_u1RmHA2IrynfAbw7c8RIf4L92qVdbApyM9qXB9D_ung2iU4kXjiX-wgSprfUZpWvCVC=w1198-h1596-no)). If video content is crucial to the user experience of a page, then specifying the width and height of videos gives the browser a much needed “heads up” so it can allocate the necessary bandwidth for loading video.

TLDR;

1. Don’t autoplay video; but defer if you must
2. Prioritize for Mobile
3. Specify video size

## Don’t wait to lose the weight

Video content adds value to the overall user experience and boosts conversion rates. High resolution videos have become commonplace in web design, with some even [featuring them](https://www.awwwards.com/websites/video/) as a [backdrop on the home page](https://www.musicboxfilms.com/). Assuming you properly optimize your video file and your webpage, videos should not have a significant negative impact on performance. This post covered some great first steps on optimizing your video for optimal web performance. If you’re interested in learning more about this, be sure to check out [these](https://rigor.com/blog/2016/01/optimizing-mp4-video-for-fast-streaming) [other](https://blog.dareboost.com/en/2018/01/optimize-your-mp4-video-for-better-performance/) [excellent](https://vimeo.com/blog/post/video-compression-basics) [blog](http://blog.catchpoint.com/2017/06/16/web-performance-101-video-optimization/) [posts](https://www.keycdn.com/blog/video-optimization).
