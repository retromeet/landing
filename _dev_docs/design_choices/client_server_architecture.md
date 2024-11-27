---
layout: development_wiki
title: API/Client architecture
permalink: /dev/design_choices/architecture
lang: "en"
---

This document describes the RetroMeet basic architecture

## API/Client architecture

Having two components instead of a single one is more complex to deploy and maintain, but the chosen API/Client architecture is chosen so that we avoid the pitfalls of not designing APIs when we're looking at very specific actions.

Any functionality available for the standard RetroMeet web client has to go through the API, there's no functionality going directly to the database, which means any one that wants to design a better client (or a client for specific actions, like administration) can do so by using the same APIs available for the web client.

The API is developed using {% external_link { "text": "Grape", "link": "https://github.com/ruby-grape/grape" } %} and has the documentation exposed through {% external_link { "text": "OpenAPI", "link": "https://swagger.io/specification/v2/" } %} documentation. Once again, the decision to go this way is to make it easier for any 3rd party app developers to get acquainted with the API, since we use {% external_link { "text": "grape-swagger", "link": "https://github.com/ruby-grape/grape-swagger" } %} it's very likely that any new endpoint will be exposed with a lot of the needed information for use.
