# Elementary
Elementary is a small, functional and modular Elm-inspired web application framework written in Scheme, for the browser.
## Introduction
### Small and modular
Elementary is made of a very small core that orchestrates the communication with side effects. Side effects (UI rendering, Websockets, HTTP, Local storage, etc...) are like plugins that you can optionally load depending on your needs. You can also create your own side effects.

### Functional

Elementary applications are expressed in terms of pure functions that describe what the data in, state transitions and the data out should look like. This behaviour define what the application does, rather than saying how to do it.

### Elm

Elementary kind of follows the `model-update-view` flow described by the [Elm architecture](https://guide.elm-lang.org/architecture/). Projects written with Elementary have a clean separation between application logic and side effects.

### Scheme

Elementary is written in Scheme and runs in the browser, on top of 
[Biwascheme](http://www.biwascheme.org/)

## Getting started

Statically serve `index.html`, play with it, and have a look a `app.scm` in order to get acquainted with some of the basic concepts behind Elementary.





