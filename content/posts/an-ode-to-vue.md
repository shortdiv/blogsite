---
title: "An Ode to Vue"
description: ""
tags: ["vue", "javascript", "frontend"]
categories: []
date: 2018-02-18T15:12:39-06:00
draft: false
---

## Ode to Vue
A couple of months ago, I made the switch from React to Vue. I had been playing around with Vue for a bit before making the switch and was impressed by how lightweight, and versatile Vue was. Compared to my initial experience learning React (👋 JSX), picking up Vue felt like a breeze. Not only is Vue very well documented, it is also very straighforward and doesn't require a lot of initial set up to get started. If you've been considering using Vue in your next project, here are a few of the reasons I think you should use Vue:

## Clearly Compartmentalized Format
Vue is mostly a composite of HTML hooked up to JavaScript with some styles peppered in. Learning Vue is therefore a matter of understanding HTML, CSS and JavaScript and you can be up and running with it by simply including a script tag in your HTML.

`<script src="https://unpkg.com/vue"></script>`

To illustrate how seamless writing and reading VueJS code is, here's an example of printing a message to a screen in Vue.

```
<template>
  <div id="app">
    {{ message }}
  </div>
</template>

<script>
var app = new Vue({
  el: 'app',
  data: {
    message: 'Good Morning!'
  }
})
</script>
```

As you can see, the message that gets slotted between the div tags is a data property defined in the Vue instance. Though we are manipulating the view in Vue, the data is stored as a state on the Vue instance. With this characteristic, Vue gives us the flexibility to update our data property without having to worry about the markup.

```
<template>
  <div id="app">
    {{ message }}
  </div>
</template>

<script>
var app = new Vue({
  el: 'app',
  data: {
    message: 'Good Morning!'
  }
})
</script>

vm.message = 'Good Afternoon!'
```

Tada!

## Data Reactivity 
The nice thing about Vue is its ability to handle data reactively. Markup is nicely decoupled from the DOM and DOM specific events, so we can write JavaScript as we would normally write it, and trust that the UI will update accordingly.

Reactivity is achieved via bindings, very similar to those used in AngularJS. Bindings allow us to notify the markup of any state changes in the Vue instance. For example, if we wanted to customize the earlier greeting message based on the time of day, we could use an `v-if/v-else` binding that will update the view based on a conditional for the time of day.

```
<template>
  <div id="app">
    <p v-if="isMorning()">Good Morning!</p>
    <p v-else>Good Afternoon!</p>
  </div>
</template>

<script>
var vm = new Vue({
  el: '#app',
  data: {
    message: 'Good Morning!'
  },
  methods: {
    isMorning () {
      return new Date().getHours() < 12 ? true : false
    }
  }
})
</script>
```

To calculate the time of day, lets create a method called `isMorning`, which checks that the current hour is not past 12. We then run this method in the `v-if` binding. If the condition is met, Vue prints the message 'Good Morning' and if not, it prints 'Good Afternoon'.

*For this example, we could have chosen to use `v-show` instead of `v-if` since they both result in a similar view. The main difference between the two however is that `v-if` mounts and unmounts a dom node while `v-show` simply toggles visibility.*

## Vue Lifecycle
Similar to its 'contender' React, Vue has a lifecycle which allows you to hook into the various 'life' stages of a component that span from creation to destruction. To give you a better idea of what that looks like, let's implement a clock to display the current time in Vue.

```
<template>
  <div id="app">{{ message }}</div>
</template>

<script>
var clock = new Vue({
  el: '#app',
  data: {
    message: null
  },
  methods: {
    getTime () {
      this.message = new Date().toLocaleTimeString()
    }
  },
  mounted () {
    this.tick = setInterval(this.getTime, 1000)
  },
  beforeDestroy () {
    clearInterval(this.tick)
  }
})
</script>
```

For this example, we use a style similar to the previous example of displaying a message. The message that gets printed is defined as a data property and we define a method to calculate the current time in the Vue instance. However instead of running the method in the markup directly we run it in a `setInterval` method defined in the `mounted` hook. We run the method in this hook so we can be certain that the function starts running on initial mount of a component. To ensure that `setInterval` terminates on component destruction, we call `clearInterval` in the `beforeDestroy` hook.

I won't go into too much detail about what all the other lifecycle hooks are, but the neat thing about lifecycle hooks is the ability to control a component at each point in its render cycle, without having to wrangle the DOM. If you're curious to learn more, [the Vue documentation does a great job of explaining them.](https://vuejs.org/v2/guide/instance.html#Instance-Lifecycle-Hooks) It even has a [handy dandy diagram](https://vuejs.org/v2/guide/instance.html#Lifecycle-Diagram) to visualize and better understand the Vue instance lifecycle. 

## Progressive Framework
Vue, unlike many front end libraries that require a complete refactor or a rehaul when scaling up, is built to scale. Let's say you're building a super lean and lightweight application, and you need to implement basic routing for navigation purposes. You've heard that `vue-router` is the default library in the Vue ecosystem for routing and you consider using it in your application. However, since your use case is fairly trivial, and you want to save your application from unnecessary bloat, you hesitate to include an entire library to your application. Thankfully, Vue offers a solution for simple routing using dynamically rendered components. It even future proofs your application because you still have the option of integrating `vue-router` later on without the risk of having to re-architect your entire application. `vue-router` just works.

Here's an example of how to implement basic routing in Vue:

```
</script>
Vue.component('FourOhFour', {
  template: `
    <div>☠️</div>
  `
})
Vue.component('Home', {
  template: `
    <div>🏠</div>
  `
})

Vue.component('About', {
  template: `
    <div>👩‍💻</div>
  `
})

new Vue({
  el: '#app'
})
</script>
```

First we define our different page levels views as separate components. We'll create a `Home` component, an `About` component and a `404` component. In our base template, let's create some link tags to get started and use the `v-on:click` binding to hook up the click event with a handler, which we'll call `navigateTo`. In order to make sure the handler knows how to handle the click events and route the app appropriately, we'll pass in the routes to the handler. Clicking on About will therefore pass the argument `/about`, while Contact will pass `/contact` to `navigateTo`.

```
<template>
  <div id="app">
    <a href="/" v-on:click="navigateTo('/')">Home</a>
    <a href="/" v-on:click="navigateTo('/about')">About</a>
    <a href="/" v-on:click="navigateTo('/contact')">Contact</a>
  </div>
</template>
```

We'll now have to create a render component that displays the content of `home`, `about`, and `countact` when the respective links are clicked on. For this, we will use a `component` tag, since we want to dynamically display content based on a user's request.

```
<template>
  <div id="app">
    ...
    <component v-bind:is="currentView"/>
  </div>
</template>
```

The component tag is a Vue-specific element that allows you to dynamically load a component without having to re-render the entire Vue instance. It loads a component based on the value of the `:is` attribute. For now, we'll create a placeholder property called `currentView`, which we will set in the `navigateTo` method. 

The `navigateTo` method will have to both load the component and route the url appropriately. So clicking on the about link will load in `About` and update the url path you see in your search bar to `[current-url-path]/about`. Instead of manually parsing and reformating string, we'll use an an object lookup table in order to match component routes with their corresponding component names. In the event that the route is missing, we'll use our `FourOhFour` page as a fallback. The last step is to use the HTML history API to update the url when a link is clicked on. 

```
<script>
...
new Vue({
  el: '#app',
  data: {
    routes: {
      '/': 'Home',
      '/about': 'About',
      '/contact': 'Contact'
    },
    currentView: "HomePage"
  },
  methods: {
    navigateTo (path) {
      this.currentView = this.routes[path] || 'FourOhFour'
      window.history.pushState({}, '', path)
    }
  }
})
</script>
```

For the full working code, and to play around with basic routing in Vue, check out [this code sandbox](https://codesandbox.io/s/3yyly5pyn1)

## Wrap Up
As front end developers, we are no stranger to the ever changing JavaScript landscape where options for UI libraries are always aplenty. 
Compared to other libraries, however, Vue gives developers the freedom to choose their own adventure while still offering a robust foundation to fall back on. What's more, the VueJS ecosystem is full of amazing resources, and the community is incredibly friendly and helpful. If this is reason enough to start learning Vue, check out the [Vue documentation](https://vuejs.org/v2/api/) and [resources](https://github.com/vuejs/awesome-vue) to get started. If you're interested in getting more involved with Vue, head over to the [community page](https://vuejs.org/v2/guide/join.html) where you can find resources to connect with fellow Vue developers and contribute to VueJS.