
# msu

> A small Shell framework that makes writing bash scripts less sucky

[![Terminal Lover](https://img.shields.io/badge/terminal-lover-blue.svg?style=flat-square)](https://github.com/GochoMugo) [![Travis](https://img.shields.io/travis/GochoMugo/msu.svg?style=flat-square)](https://travis-ci.org/GochoMugo/msu)

* [An Introductory Post on `msu`](https://gochomugo.github.io/musings/msu-introduction/)!
* [Project Principles](#principles)
* [Showcase of modules using `msu`][showcase]


## features:

> **`msu` wishlist**

* [x] [automated/manual installation][installation]
* [x] [small but comprehensive internal library](https://github.com/GochoMugo/msu/blob/master/docs/api.md)
* [x] [support external modules][modules]
* [x] [auto-loading aliases modules](https://github.com/GochoMugo/msu/blob/master/docs/modules.md#aliases-auto-loading)
* [x] [install module from github](https://github.com/GochoMugo/msu/blob/master/docs/modules.md#installing)
* [x] [highly tested](https://travis-ci.org/GochoMugo/msu)
* [x] self upgrade
* [ ] load/unload aliases
* [ ] error catching/handling
* [ ] bash completion
* [ ] compatibility for other shell types e.g. zsh


## installation:

```bash
⇒ wget -qO- https://git.io/vTE0s | bash
⇒ msu help
```

> Requires [`git`](http://git-scm.com/)

More [installation instructions][installation].


## documentation:

Documentation is placed in the [`docs/`](https://github.com/GochoMugo/msu/tree/master/docs/) directory:

* [installation][installation]
* [modules][modules]
* [API][api]
* [Showcase][showcase]


<a name="principles"></a>
## principles:

1. **Little added complexity.** `msu` should **not** warrant the user to learn scripting all over again. An existing script should be converted into a module with less effort.
1. **Minimal**. `msu` core should be as little as possible. How? Use common algorithms and data structures. Avoid doing something too fancy.
1. **Highly configurable**. Using environment variables and command-line switches, `msu` should be configurable in all its operations, including installation.


## license:

__The MIT License (MIT)__

Copyright &copy; 2015 GochoMugo <mugo@forfuture.co.ke>


[installation]:https://github.com/GochoMugo/msu/tree/master/docs/installation.md "msu installation"
[modules]:https://github.com/GochoMugo/msu/tree/master/docs/modules.md "msu modules"
[api]:https://github.com/GochoMugo/msu/tree/master/docs/api.md "msu API"
[showcase]:https://github.com/GochoMugo/msu/blob/master/docs/showcase.md "showcase of modules using msu"

