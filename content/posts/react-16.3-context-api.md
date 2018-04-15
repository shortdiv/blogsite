---
title: "Old to New; Contexts in React 16.3"
tags: ["react", "javascript", "frontend"]
categories: []
date: 2018-04-01T14:18:15-05:00
draft: false
---

A couple of days ago, React 16.3 was released. The update brought with it many changes, including an official (recommended for use) Context API that replaces the old (not recommended for use) Context API, a `createRef` API, and a `forwardRef` API to name a few. Among the changes introduced in React 16.3, I most anticipated the change to the Context API.

## Adding Context to `Context`

For those of you unfamiliar with the concept, `context` is a technique in React used to pass data down from parent to child without having to rely on props. Passing data via props is a common pattern used in React to give children access to parent data. While declarative, passing props can be unnecessarily verbose as it requires passing state explicitly down through the tree. If a child needed access to a grandparent component, the state would have to be passed to every intermediate component regardless of whether or not that component needs access to that data property. React's context feature offers you the ability to pass state down while bypassing intermediary components.

Prior to the React 16.3 release, context was strongly discouraged and was marked as an unstable and potentially breaking API. Dan Abramov even wrote a tongue in cheek code snippet to consider when deciding how and when to use context in an application.

![Dont use old Context](/images/dontusecontext.jpeg "Don't Use Old Context")

Despite this and many warnings of future incumbent changes that dominated the first half of the pre 16.3 context docs, [context remained untouched for many years](https://twitter.com/brian_d_vaughn/status/984853239748177920) and became a fundamental feature that powered popular tools like React Router and Redux.

I too used context and depended on the API in my React applications. One such use case, was in a project I worked on where I componentized map layers in MapboxGL using React. My goal in integrating React with MapboxGL was to create an interface that enabled me to create my map with overlaying data as declaratively nested components rather than as imperative JavaScript code. Here's a quick demonstration of what I mean by that:

### MapboxGL

```
var map = new mapboxgl.Map({...});
map.addSource({})
map.addLayer({})
```

### MapboxGL + React

```
class BaseMap extends React.Component {
  componentDidMount() {
    var map = new mapboxgl.Map({...})
  }
}

class SourceLayer extends React.Component {
  componentDidMount() {
    map.addSource({...})
  }
}

class FeatureLayer extends React.Component {
  componentDidMount() {
    map.addLayer({...})
  }
}
```

The code above is the structure for creating a new map instance and adding layers to the map to visualize data on it. If you're familiar with the MapboxGL API, you'd know that methods such as `addLayer` and `addSource` are available on the created map instance. In the imperative version, since all methods are lumped together in one function call, map is available in local state. This is not the case when the map methods are separated out into components. `FeatureLayer` and `SourceLayer` need access to the `map` instance that gets created in the `BaseMap` component. While this instance can be passed to its children components via props, it is cumbersome and repetitive to have to do so for every child component. This is where context comes into play.

If you'd like to learn more about the conceptual pieces that go into building a React-Mapbox API, [I gave a talk about it](https://www.youtube.com/watch?v=LrqmA_BoV9c) and [created some codepen pens demonstrating it](https://codepen.io/collection/AQdKrV/).

## Old Context API

In the [React < 16.3 API](https://github.com/reactjs/reactjs.org/blob/2739197161cd60b8c211039a3cadd3e2a8ac2422/content/docs/context.md), you could harness contexts by adding childContextTypes and getChildContext to your parent element (i.e. the context provider) and by defining contextTypes in your child element. This way, parents can define data to be passed down to children and children can access parent data if they so choose to. Here's a quick run through of what that looks like:

First we define our parent element, which is our `BaseMap` component:

```JS
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

```JS
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

In the unstable API, context is achieved by creating a context provider and a context consumer component.

A context provider is defined by a component with `childContextTypes` and `getChildContext`.

`childContextTypes`: A static property where you can define the structure of the context object; very similar to propTypes but not optional.

`getChildContext`: A prototype method that returns the context object to pass down the component’s hierarchy. This will be called when the state or props changes.

A context consumer is any component that chooses to "subscribe" to a context via declaring it in contextTypes. Upon doing so, context is available via `this.context`. Alternatively, context is available as the second parameter in some lifecycle hooks; namely `componentWillReceiveProps`, `shouldComponentUpdate`, `componentWillUpdate` and `componentDidUpdate`.

## New Context API

In the React 16.3 update to the context API, contexts are more declarative and the provider and the consumer of a context are defined by what is wrapped within `[YOURCONTEXT].Provider` and `[YOURCONTEXT].Consumer`.

To create a new context, we first instantiate the `createContext` method, `React.createContext`

```JS
const mapContext = React.createContext()
```

This creates a `Provider` and `Consumer` pair that can then be used to create and pass context through our application. In our example mapbox component, the `Provider` would be our basemap and `Consumer` would be our layer component.

Since BaseMap is responsible for passing the map state through to its children, let's refactor our basemap component so that we can define it as a context Provider. 

```JS
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

Now Layer component will need access to `mapContext` in order to call addLayer on the mapbox instance. There are 2 ways in which a descendent component can access context; via the render function and via lifecycle hooks.

### Option 1: Render function

The context Provider/Consumer pair gives a component access to a context, regardless of whether it chooses to set it or get it. In our Provider implementation ealier, we explicitly set context via a value prop in the `MapContext.Provider` tag. In order to access that data passed to Provider, a Consumer takes a function as a child and thereby has access to the current context value and can return a React node with that specific context passed to it.

In the render function for the Consumer, we're wrapping content in a `MapContext.Consumer` tag, much like we did in our Provider component. Then in the Consumer tag, we can access the context and pass that to a function called `addLayer` that adds a layer to our mapbox instance object. Notice that in our render function, we're wrapping the contents of Consumer in a `React.Fragment`. This is very much a hack since our `Consumer` context wrapper expects a react node to which context will be passed. Since we're returning null, we can get around passing an actual node by using react fragments and calling a function from within the fragment. #winning

```JS
class FeatureLayer extends React.Component {
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

While this isn't the most optimal way to use context, it's one way of manipulating contexts internally so that we can still maintain a clean externally facing API for our React-Mapbox integration.

```JSX
<BaseMap>
  <FeatureLayer />
</BaseMap>
```

### Option 2: Lifecycle Hooks

Most of the time however, accessing values from context is done so via lifecycle hooks. In order to access context from our Consumer from a lifecycle hook, we can pass context directly to the component via props.

```JSX
<BaseMap>
  <MapContext.Consumer>
    {context => <FeatureLayer context={context} />}
  </MapContext.Consumer>
</BaseMap>
```

We can now update our Layer component such that context is accessed via a lifecycle hook than via the render function.

```JS
class Layer extends React.Component {
  ...
  componentDidMount() {
    this.props.context.mapContext.addLayer({...})
  }
}
```

Compared to the previous approach in Option 1, passing context in as a prop is a lot clearer since we can isolate the logic of creating a new layer in the `componentDidMount` lifecycle hook. Our templates are a lot more declarative as we can clearly see the consumer of a context and how data is being passed from Provider to Consumer. Even so, with this implementation, we've lost the cleanliness of our previous API. Since FeatureLayer gets context as a render prop from the context consumer wrapper, the markup is now slightly more convoluted. Let's work on extrapolating our our context code so we return to our previous API.

I'll start by refactoring our layer component to be a function that returns a component called `AddLayer`. The purpose of Layer would be to get the context and pass that on to the AddLayer component, which will add the layer to the map

```JS
function Layer(props) {
  return <MapContext.Consumer>
    {context => <AddLayer {...props} context={context}/>}
  </MapContext.Consumer>
}

class AddLayer extends React.Component {
  componentDidMount() {
    this.props.context.mapContext.addLayer({...})
  }
}
```

With this, we have returned to our previous cleaner API, where we can wrap elements without having users of the API have to know about how context is being used under the hood.

## Wrap Up

Compared to the previous unstable version, the new context API is more declarative. While this comes with the draw back of slightly more lines of code and potentially more abstraction layers (i.e. FeatureLayer now has two parts, FeatureLayer and AddLayer), it reduces the cognitive load of having to dig into component internals via PropTypes etc to understand the origin and usage of a context since context is declared in the markup itself.

If you're interested in playing around with the code I wrote for this, check out [this codepen collection](https://codepen.io/collection/nZrBNp/)