# Elementary
Elementary is a small, modular, Elm-inspired web application framework written in Scheme, for the browser.
## Introduction
### Scheme
Elementary is written in Scheme and runs in the browser, on top of 
[Biwascheme](http://www.biwascheme.org/)

### Elm
Elementary kind of follows the `model-update-view` flow described by the [Elm architecture](https://guide.elm-lang.org/architecture/). Projects written with Elementary have a clean separation between application logic and side effects.
### Small  and modular
Elementary is made of a very small core that orchestrates the communication with side effects. Side effects (UI rendering, Websockets, HTTP, Local storage, etc...) are like plugins that you can optionally load depending on your needs. You can also create your own side effects.