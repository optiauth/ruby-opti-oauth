# Design Rationale

Why yet another OAuth2 client?
Nearly all the Ruby implementations of OAuth2 are either strongly web-oriented (being very tied to Rack and/or Rails), or a bit clunky to use (changing the client state means it can cause race conditions between requests) or not maintained at all.

Opti aims at being mostly stateless, easy to use and integrate in a variety of environments and architectures, and flexible enought to satisfy all possible use-cases where OAuth2 support might be needed.

