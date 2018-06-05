---
title: "Testing With Custom Matchers in Vue"
description: "Techniques for writing custom matchers with various popular testing libraries."
tags: ["javascript", "frontend", "vue", "testing"]
categories: []
date: 2018-05-26T15:32:23-05:00
draft: false
---

Testing libraries like Jasmine, and Jest often provide conditionals like `toBeEqual` or `toHaveBeenCalledWith` to check that a piece of code has an expected outcome. However, more often than not, a project might have a unique set of conditions that it might want to check against that are not included in the vocabulary of a testing library. For example, if you wanted to test that an element in a vue instance had content, you could create a method called `hasContent` and pass it an element to check whether or not its contents are empty.

```JS
describe('component', () => {
  let toHaveContent
  beforeEach(() => {
    hasContent = (el) => {
      return el.innerHTML.length !== 0
    }
  })
  it('should have content', () => {
    const vm = new Vue({
      template: `<div><p>{{ msg }}</p></div>`,
      data () { return msg: 'hello there' }
    }).$mount()
    const isNonEmptyEl = hasContent(vm.$el)
    expect(isNonEmptyEl).toBe(true)
  })
})
```

While testing in this manner works, your code will have to be replicated when you have to test for whether an element has content across multiple specs. Thankfully, test libraries like Jest and Jasmine offer a solution to this problem via custom matchers.

# Custom Matchers

Custom matchers allow you to encapsulate custom matching code for use across multiple tests. A custom matcher is a comparison function that compares an actual value with an expected value. Ideally, a custom matcher is created in a beforeEach block or in a separate setup file that your test library uses to run tests.

## Jasmine

To create a custom matcher and append it to Jasmine, you can use `jasmine.addMatchers`. For the exact documentation of this API, refer to the [Jasmine docs](https://jasmine.github.io/2.0/custom_matcher.html).

```JS
describe('components', () => {
  beforeEach(() => {
    jasmine.addMatchers({
      toHaveContent: () => {
        const isNonEmpty = () => {
          return options.$el.innerHTML.length !== 0
        }
        return {
          compare: (options) => {
            const result = isNonEmpty(options)
            if(result.pass) {
              result.message = `expected ${this.utils.printReceived(
                options
              )} not to be have content`
            } else {
              result.message = `expected ${this.utils.printReceived(
                options
              )} to have content`
            }
            return result
          }
        }
      }
    })
  })
  it('should have content', () => {
    const vm = new Vue({
      template: `<div><p>{{ msg }}</p></div>`,
      data () { return msg: 'hello there' }
    }).$mount()
    expect(vm).toHaveContent()
  })
})
```

For the working code, check out [the repo](https://github.com/shortdiv/vue-testing-with-custom-matchers/tree/master/vue-jasmine-custom-matchers)

## Chai

To create a custom matcher and append it to Chai, you can use `chai.Assertion.addMethod` or `utils.addMethod`. For the exact documentation of this API, refer to the [Chai docs](http://www.chaijs.com/api/plugins/#method_addmethod)

```JS
describe('component', () => {
  beforeEach(() => {
    chai.use(
      (chai, utils) => {
        utils.addMethod(chai.Assertion.prototype, 'toHaveContent', function() {
          const obj = this._obj
          this.assert(
            obj.$el.innerHTML.length > 0
            `expected ${obj} to have content but was empty`,
            `expected ${obj} to not have content`
          )
        })
      }
    )
  })
  it('should have content', () => {
    const vm = new Vue({
      template: `<div><p>{{ msg }}</p></div>`,
      data () { return msg: 'hello there' }
    }).$mount()
    expect(vm).toHaveContent()
  })
})
```

For the working code, check out [the repo](https://github.com/shortdiv/vue-testing-with-custom-matchers/tree/master/vue-chai-custom-matchers)

## Jest

To create a custom matcher and append it to Jest, you can use `expect.extend`. For the exact documentation of this API, refer to the [Jest docs](https://facebook.github.io/jest/docs/en/expect.html#expectextendmatchers).

```JS
describe('component', () => {
  beforeEach(() => {
    expect.extend({
      toHaveContent: (received) => {
        const pass = received.$el.innerHTML.length > 0
        if (pass) {
          return {
            message: () =>
              `expected element not to have content`,
            pass: true,
          }
        } else {
          return {
            message: () =>
              `expected element not to have content`,
            pass: false,
          }
        }
      }
    })
  })
  it('has content', () => {
    const vm = new Vue({
      template: `<div><p>{{ msg }}</p></div>`,
      data () { return msg: 'hello there' }
    }).$mount()
    expect(vm).toHaveContent()
  })
})
```

You can also extrapolate the code in the beforeEach block into a separate file and then update your `jest.config` file to include the matcher file to ensure that jest accounts for custom matchers when it runs your tests.

```JS
const customMatchers = {}
customMatchers.toHaveContent = () => {...}
global.expect.extend(customMatchers)
```

```JS
module.exports = {
  ...
  setupTestFrameworkScriptFile: '<rootDir>/tests/unit/matchers'
};
```

For the working code, check out [the repo](https://github.com/shortdiv/vue-testing-with-custom-matchers/tree/master/vue-jest-custom-matchers)

## Conclusion

Custom matchers can be tricky to master and are often unique to the testing library you're working with. However, once mastered, custom matchers add an element of creativity that makes writing tests a little more enjoyable. Happy Testing! :D