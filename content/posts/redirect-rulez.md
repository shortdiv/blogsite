---
title: "Redirect Rulez"
description: ""
tags: [redirects]
categories: [redirects]
date: 2019-01-07T22:33:18-06:00
draft: false
---

# Redirect Rulez

Browsers rely on URLs to access content on the web. One way to think about URLs is as a giant phone book for the web. When a browser wants access to a specific resource, it looks it up in the “phone book” and makes a request for it by visiting the address specified. However, like physical addresses, virtual addresses are not permanent and are subject to change. When a person moves irl, they often file a change of address at the local post office so that mail gets routed appropriately. Changing addresses on the web can be similarly achieved using redirect rules.

Redirect rules allow you to easily direct traffic from one address to another. They are also commonly used to gracefully handle errors, ensure proper SEO, and restrict navigation based on a user’s access privileges. From a technical perspective, redirect rules require communication between the browser and the server in order to properly route a request that comes in.

## HTTP

Generally, the communication between browser and server happens over HTTP (HTTPS). This protocol, particularly the HTTP status code, informs the browser of the status of a sent request so that it can appropriately respond. For instance, a `200 OK` status corresponds to a successful request and allows the browser to pass the requested resource over the client. On the other hand, a `404 Not Found` correlates to a missing resource, so the browser responds in kind with an error message to the client. The status codes are broadly categorized by the type of their response; informational responses (1XX), successful responses (2XX), redirects (3XX), client errors (4XX), and servers errors (5XX).

When implementing redirect rules, we often use the `301 Moved Permanently` and the `302 Found` status codes. The main difference here is that the 301 is cacheable by default unless otherwise specified by the method definition or explicit `cache-controls` in the header.

## Redirects in the Wild

There are many ways to handle redirects on the web.

### HTML meta tag

A common approach to redirecting a URL is via the meta refresh tag. Using the meta tag in the head of your HTML, you specify the delay before the browsers redirects and a URL to redirect a page to. While this is a quick and easy way to do redirects, the meta refresh tag, as the name indicates, causes a full page refresh, which can be result in an unsightly flash of content as the redirect is being processed. Moreover, there are some additional usability drawbacks to using this tag particularly in older browsers, where the back button becomes disabled.

```html
<meta
  http-equiv="refresh"
  content="0; URL='http://my-awesome-new-website.com'"
/>
```

### Apache Redirects

Another popular strategy to handling redirects is via the `htaccess` file. This strategy relies on a website being run on an apache web server. Apache handles redirects via script code modifications to either of these text based config files: htaccess and httpd.conf. Of the two, the former is most commonly used. To implement a redirect, you would simplify add the redirect rule then specify the old website followed by the new website. Since this `htaccess` file is on the server of the old website, we don’t need to specify its exact URL and `/` is sufficient. Though `htaccess` is incredibly comprehensive, it isn’t always easy to write, with many directives and flags to [decipher](https://httpd.apache.org/docs/2.4/rewrite/) and choose from. Debugging can also be challenging because it requires digging into the apache error log.

```
Redirect 301 / http://www.my-awesome-website.com/
```

### NodeJS redirects

Redirects are also executable via the `http` module in NodeJS. The `http` module gives you easy write access to your headers so you can instruct your server to handle the redirect as a request comes through. As mentioned, the one caveat to this strategy is that it requires NodeJS on the server to work.

```js
const http = require("http");

//create a server using nodejs http module
const server = http.createServer((req, res, next) => {
  res.writeHead(301, { Location: "http://www.my-awesome-website.com" });
  res.end();
});

server.listen(process.env.PORT || 3000);
```

### Netlify 🎇

If your website is hosted on Netlify, redirects can be achieved with a text file —much like in an Apache run website—labelled `_redirects` located in the dist or public folder of your project. Compared to the `htaccess` file however, Netlify’s redirect rules are incredibly straightforward. For one, you don’t have to specify any flags or special conditions for the redirect rule. Moreover, Netlify offers role based access control via redirects, which are incredibly powerful yet simple mechanisms for restricting access to sites and/or specific pages. I personally consider the readability of Netlify’s redirect rules a feature. However, some may see this feature as limiting since it doesn’t provide as fine grained of a control over your redirects compared to other solutions like `htaccess`. Moreover, it’s worth mentioning also that role based redirects are only available under the paid Netlify teams plan.

```
/*  /https://my-awesome-website.com/:splat    302

# Role based redirects
/* /index.html 200! Role=editor
```

## Will you, won't you, will you, won't you _*redirect*_

Rewrite rules help you determining the flow of traffic to your sites. This comes in handy especially in cases when your website has moved but also in situations when you want to redirect unauthorized users from viewing private content or when you want to batch multiple URLs with similar content for SEO (canonicalization anyone?). Thankfully, redirect rules is a solved problem and we have many solutions at our disposal when it comes to writing redirect rules. Just pick one and let the traffic control gnomes in your browser do the rest!
