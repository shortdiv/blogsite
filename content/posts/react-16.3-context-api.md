---
title: "Old to New; Contexts in React 16.3"
date: 2018-04-01T14:18:15-05:00
draft: true
---

**Disclaimer: This isn't a critique of React itself but more specifically of the new Context API or at least my understanding of it.**

A couple of days ago, React 16.3 was released. The update brought with it many changes, including an official (recommended for use) Context API that replaces the old (not recommended for use) Context API, a `createRef` API, and a `forwardRef` API to name a few. Among the changes introduced in React 16.3, I most anticipated the change to the Context API. 

## Context on Context
A common technique for passing state from parent to children components is via props. Passing props is a declarative way of passing data down from the parent such that you can keep track of how and which props are being passed through. This makes it such that your code is easy to read and reason about. While this is a common paradigm, in some cases, you might want to pass state without having to pass props down manually at each level. For instance, a grandparent component should be able to pass data down to a grandchild without having to go through the parent element. In React, passing props from one component to another while bypassing intermediary components is possible with the context API.

*The examples in this post draw from a previous component snippet I wrote where I componentized a webgl map into its constituent (render null) elements using the MapboxGLJS API. If you're not familiar with mapbox and rendering null components, check out this [talk I gave about that here](https://www.youtube.com/watch?v=LrqmA_BoV9c) as well as [my codepen collection here](https://codepen.io/collection/AQdKrV/)*

## Old Context API
In the React 15 API, you could harness contexts by adding childContextTypes and getChildContext to your parent element (i.e. the context provider) and by defining contextTypes in your child element. This way, parents can define data to be passed down to children and children can access parent data if they so choose to. Here's a quick run through of what that looks like: 

First we define our parent element, which is our `BaseMap` component:  
```
class BaseMap extends React.Component {
  ...
  getChildContext() {
    return {
      map: this.state.map
    }
  }
  componentDidMount() {
      const map = new mapboxgl.Map({...})
      map.on('load', () => {
          this.setState({ map })
      })
  }
  render() {
      <div>
        { this.state.map && this.props.children }
      </div>
  }
}
BaseMap.childContextTypes = {
  map: React.PropTypes.object
}
```

Then we define our child component, which is our `Layer` component:
```
class Layer extends React.Component {
  componentDidMount() {
    const { map } = this.context
    map.addLayer({...})
  }
  render() {
    return null
  }
}
Layer.contextTypes = {
  map: React.PropTypes.object
}
```

## New Context API (ch-ch-ch-changes)
In the React 16.3 update to the context API, contexts are more declarative and the markup gives you clearer indication as to who the provider and the consumer of a context is. First, we create a context by calling `React.createContext`

```
const mapContext = React.createContext()
```

This creates a `Provider` and `Consumer` pair that can then be used to create and pass context through our application. In our example mapbox component, the `Provider` would be our basemap and `Consumer` would be our layer component. 

Since BaseMap is responsible for passing the map state through to its children, let's refactor our basemap component so that we can define it as a context Provider. 

```
class BaseMap extends React.Component {
  ...
  render() {
    return (
      <MapContext.Provider value={{
        mapContext: this.state.map
      }}>
        <div className="mapbox">
          {this.state.map && this.props.children}
        </div>
      </MapContext.Provider>
    )
  }
}
```

Here, we're utilizing the MapContext Provider/Consumer pair that we created earlier using `React.createContext` and specifically wrapping the rendered elements in our BaseMap component with `MapContext.Provider`. The Provider tag accepts a value as a prop, which is where we define the data (mapContext) to be passed through to descendent components.

Now Layer component will need access to `mapContext` in order to call addLayer on the mapbox instance. Though layer may be nested in the BaseMap component like so: 

```
<BaseMap>
  <Layer />
</BaseMap>
```

Layer needs to explicitly access data passed down from the parent BaseMap element. There are 2 ways in which a descendent component can access context. Via the render function and via lifecycle hooks.

### Option 1: Render function 
The context Provider/Consumer pair gives a component access to a context, regardless of whether it chooses to set it or get it. In our Provider implementation ealier, we explicitly set context via a value prop in the `MapContext.Provider` tag. In order to access that data passed to Provider, a Consumer takes a function as a child and thereby has access to the current context value and can return a React node with that specific context passed to it. 

In the render function for the Consumer, we're wrapping content in a `MapContext.Consumer` tag, much like we did in our Provider component. Then in the Consumer tag, we can access the context and pass that to a function called `addLayer` that adds a layer to our mapbox instance object. Notice that in our render function, we're wrapping the contents of Consumer in a `React.Fragment`. This is a bit of a hack because Consumer expects a react node to be returned which is antithetical to our goal of rendering null. Using a fragment allows you to define a valid react node without actually adding an extra node to the DOM. #winning

```
class Layer extends React.Component {
  ...
  addLayer (map) {
    map.addLayer({...})
  }
  render() {
    return (
      <MapContext.Consumer>
        {(context) => (
          <React.Fragment>
          { this.addLayer(context.mapContext) }
          </React.Fragment>
        )}
      </MapContext.Consumer>
    )
  }
}
```

The nice thing about handling contexts this way is that now you can write your templates in a declarative way that's a little easier to reason about, despite the internal complexities.

```
<MapContextProvider>
  <FeatureLayer />
</MapContextProvider>
```

### Option 2: Lifecycle Hooks
Most of the time, accessing values from context is done so via lifecycle hooks. In order to access context from our Consumer from a lifecycle hook, we can pass context directly to the component via props.

```
<MapContextProvider>
  <MapContext.Consumer>
    {context => <FeatureLayer context={context} />}
  </MapContext.Consumer>
</MapContextProvider>
```

We can now update our Layer component such that context is accessed via a lifecycle hook than via the render function. 

```
class Layer extends React.Component {
  ...
  componentDidMount() {
    this.props.context.mapContext.addLayer({...})
  }
}
```

Compared to the previous approach in Option 1, passing context in as a prop is a lot clearer since we can isolate the logic of creating a new layer in the `componentDidMount` lifecycle hook. Moreover, our templates become a lot more declarative as we can clearly see the consumer of a context and how data is being passed from Provider to Consumer. 


## Wrap Up
If you've ever worked with Vue, you'd notice that the new Context API in React works a lot like scoped slots in Vue. While it requires additional wrapper components, it is incredibly declarative and it is easy to see how context is being passed by simply looking at the composite templates. If you're interested in playing around with the code I wrote for this, check out [this codepen collection](https://codepen.io/collection/nZrBNp/)