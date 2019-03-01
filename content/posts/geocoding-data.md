---
title: "Geocoding Data"
description: ""
tags: [gis, mapbox]
categories: []
date: 2019-02-28T23:17:54-06:00
draft: true
---

A key step in the data visualization process is the conversion of data to the right format. When working with geospatial related information in particular, data needs to be in [geoJSON](http://geojson.org/) to be accurately superimposed onto a map. In many instances, geospatial data available via Open Data Portals like data.gov is already in a proper format to be mapped. However, there are times when the available data needs to be cleaned and/or transformed into a more appropriate format to be useable. For example, physical address data needs to be converted to coordinates so they can be properly added to a map. In cases like these, data formatters specifically known as geocoders come in handy.

## GeoJSON

Before diving into what the process of geocoding entails, let’s first get familiar with what geoJSON is. Here’s an example of a very basic geoJSON data point.

```json
{
  "type": "Feature",
  "geometry": {
    "type": "Point",
    "coordinates": [-87.62329999999997, 41.8826]
  },
  "properties": {
    "name": "Cloud Gate/The Bean",
    "city": "Chicago, IL"
  }
}
```

As you can see, this geoJSON snippet is of type `Feature`. `Feature` is one of the most basic forms of geoJSON since it represents a single data point with a geometry and additional identifiable properties attached to it. Here we can clearly tell that this feature represents the location of Cloud Gate aka The Bean, which is a landmark in the city of Chicago. It’s worth noting that the most important elements of a `Feature` is the `geometry` object, since it represents actual mappable coordinates. The `properties` object on the other hand, while handy (as supplemental information), are not necessary in valid geoJSON.

In the event of more than one feature, data needs to be organized into an array with a type of `FeatureCollection`. A `FeatureCollection` is nothing more than an object with a type `FeatureCollection` and an array of `features`. It’s useful to think of `Feature` as a subset of `FeatureCollection`; i.e. a `FeatureCollection` is a collection of features. Here’s an example of what that looks like:

```json
{
  "type": "FeatureCollection",
  "features": [
    {
      "type": "Feature",
      "geometry": {
        "type": "Point",
        "coordinates": [-87.62329999999997, 41.8826]
      },
      "properties": {
        "name": "Cloud Gate/The Bean"
      }
    },
    {
      "type": "Feature",
      "geometry": {
        "type": "Point",
        "coordinates": [-87.6359282, 41.8788763]
      },
      "properties": {
        "name": "Willis Tower"
      }
    }
  ]
}
```

In the examples discussed so far, we’ve only used one geometry type—Point. However, geoJSON supports multiple other geometry types in addition to `Point`. `LineString`, `Polygon`, `MultiPoint`, `MultiLineString`, and `MultiPolygon` are examples of these other geometry types. As you may have guessed, these other types require more than one coordinate and enable you to superimpose both open (i.e. lines) and closed (i.e. polygons) shapes onto a map. To illustrate, check out this two datasets—[first](https://gist.github.com/shortdiv/85daca1c510d3b12e73b99e9af3c9d74/), [second](https://gist.githubusercontent.com/shortdiv/0910cf599cad5a2c0cf0971a93c6f140/) (click on raw to see the actual data). The first dataset represents the neighborhood boundaries in Chicago and is one example of geometric data that is of type `Polygon`. The second represents bike routes traveled by users of the Divvy bike share program and is an example of data of type `LineString`.

## Geocoding

As we mentioned earlier, geocoding is process of converting a physical address to a geographic coordinate. For instance, the process that Google Maps executes when it takes an address from the search field and drops a marker onto a map, is a real life example of geocoding. While there are ways to build a geocoder from scratch, it can be tedious and imprecise. Moreover, it requires a database of addresses for optimum accuracy, which is something the average developer likely doesn’t have access to. Thankfully, we can make things easier for ourselves by instead utilizing geocoding services like those offered by Google and Mapbox to geocode an address for us. For this example, we’ll be specifically using Mapbox’s geocoding service available via the client API.

## Mapbox Geocoder

To start, let’s instantiate a new mapbox client from which we will access the geocoding service. For this, we’ll need an API access token, which is accessible in the accounts tab once you sign up or log in to the Mapbox service.

```js
var mbClient = new MapboxClient("API_KEY_HERE");
```

With the mapbox client instance, we can now access Mapbox’s geocoder, more specifically known as `geocodeForward`. Forward geocode takes in a query (the address) and a limit (the number of responses). According to [the docs](https://github.com/mapbox/mapbox-sdk-js/blob/e9fe73d0032543524da6a70288f2d26c5e3146ff/docs/services.md#forwardgeocode), the API is accessed via `forwardGeocode`. However, since I’ve accessed the API via `geocodeForward` in the past (and I’ve verified that this still works), I’m going with that approach. I’ll then pass in the specific query directly as the first argument and the limit as an options object in the second argument.

```js
mbClient.geocodeForward("chicago, usa", { limit: 1 });
```

With these two lines of code, you should now be able to successfully convert an address to geographic coordinates. 🎉

## GeoJSON-ify

Geocoding an address is of course only the first step in making the data mappable. To make the data usable on a map, it must be represented in the right geoJSON format. Since we’re dealing with geometric types of `Point`, our geoJSON is fairly straightforward and will only consist of `Features` of type `Point` in a `FeatureCollection`. So we’ll eventually want to end up with something like this:

```json
{
  "type": "FeatureCollection",
  "features": [
    {
      "type": "Feature",
      "geometry": {
        "type": "Point",
        "coordinates": [...]
      },
      "properties": {...}
    },
    ...
  ]
}
```

We’ll now write a simple function to call Mapbox’s geocoding service and pipe the result into our desired format. Since the service we’re using may take some time, we’ll wrap this in an async/await so the function `geojsonify` will return a promise.

```js
var geojsonify = async function(place) {
  var t = await mbClient.geocodeForward(`${place}`, { limit: 1 });
  var feature = {
    type: "Feature",
    geometry: {
      type: "Point",
      coordinates: t.entity.features[0].center
    },
    properties: { location: `${place}` }
  };
  return feature;
};
```

We can then call the `geojsonify` function and grab the result like so:

```js
geojsonify().then(res => console.log(res));
```

We can even go one step further and make our function accept an array of addresses so we can convert multiple addresses into geoJSON coordinates. We will do this by utilizing a map function, which will return an array of promises.

```js
var geojsonify = function(alltheplaces)
  return alltheplaces.map(async function(place) {
    var t = await mbClient.geocodeForward(
      `${place}`, { limit: 1 }
    )
    var feature = {
      "type": "Feature",
      "geometry": {
        "type": "Point",
        "coordinates": t.entity.features[0].center
      },
      "properties": { location: `${place}` }
    }
    return feature
  })
}
```

Since this function is now a series of promises, we will use `Promise.all` to ensure that all promises are resolved before returning a series of geojsonified addresses like so:

```js
var placeData = ["chicago, il, usa", "boston, ma, usa", "columbus, oh, usa"];
Promise.all(geojsonify(placeData)).then(res => console.log(res));
```

## Oh! All the places you will geoJSONify

As we’ve seen so far, working with a geocoding service like Mapbox is incredibly straightforward and requires nothing more than passing your data through an API call. A caveat worth mentioning is that while convenient, geocoding services do have caps on the number of requests you can make. While the likelihood of you ever hitting that cap is low, it’s good to keep in mind when considering a dataset—maybe stay away from a 6 million+ row dataset? If you enjoyed this article but are too lazy to write your own code, I understand, so [here’s a codepen snippet](https://codepen.io/shortdiv/pen/omydOr) you can use to play around with Mapbox’s geocoding service. Keep in mind that this geocoding service is pretty specific and relies on a dataset where there are `eventCity` and `eventCountry` key attributes.
