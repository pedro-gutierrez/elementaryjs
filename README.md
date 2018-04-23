# Elementary
Elementary is a small, functional and modular Elm-inspired, UI framework written in Scheme, for the browser.
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

Statically serve `index.html`, play with it from your browser, and have a look at the annotated source in `app.scm` in order to get a feel of some of the basic concepts behind Elementary.

## Concepts

Elementary applications are declared as a set of pure functions:


### Init

The `init` function returns a specification of the initial state of our application. An init spec is very similar to an update spec. It is made of three parts:

1. A condition (always 'true)
2. A model spec
3. A list of commands to be triggered. Each command is defined by an effect and an encoder

### Encoders

The `encoders` function returns a specification of the different kinds of data to be sent by our application to side effects as commands.


### Decoders

The `decoders` function return the list of specifications of the data expected by our application, from side effects. Each decoder defines the input data structure and the message to map to that data.

### Update

The `update` function is the heart of our application logic. It describes the state machine that mutates the internal model and triggers new commands to be sent to side effects. Such state machine is expressed as a list of update specs. Each update spec is defined by:

1. A message identifier (see Decoders).
2. A list of child specs.

Each update child spec is made of:

1. A condition
2. A model spec, that defines the new state for the application
3. A list of commands to be sent to side effects.

Each child spec must have a condition expression. 

When data is received from a side effect, and is succesfully decoded into a messsage, then all update specs matching that message are evaluated. The first that verifies that its condition is true is applied, and its model and commands specs evaluated.

### Effects

The `effects` function return the spec of the side effects
required by our application in order to work properly. Side effects are plugins that will be loaded by the Elementary core, according to the settings given to each one of them.

Real world applications will require multiple and relatively complex side effect for http, websockets communications, local storage, camera and microphone access, etc...

List of effects available so far:

* [Elementary UI](./scm/elementary-ui.scm): An Elementary UI effect based on [Maquette](https://maquettejs.org).
* [Elementary WS](./scm/elementary-ws.scm): An Elementary Websocket effect.

More to come soon!

