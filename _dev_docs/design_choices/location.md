---
layout: development_wiki
title: Locations
permalink: /dev/design_choices/locations
lang: "en"
---

This document describes how user locations are stored and how they are compared.

## Storing user locations

RetroMeet does not keep constant tracking of user locations, unlike some other dating apps. In other words, if a user moves from one neighborhood to another during their daily routine, RetroMeet will not move their profile around to be seen by some other people.

Instead, RetroMeet uses OpenStreetMap data to allow the user to choose their location, we only allow places that are qualified by OSM as a "settlement". From their documentation:

> A featureType of settlement selects any human inhabited feature from 'state' down to 'neighborhood'.

That means that for instance a user can select to be on "State of Rio de Janeiro, Brazil" or "Méier, Rio de Janeiro, RJ, Brazil". The location data stored is what OSM considers to be the location of that feature, which is most likely the central position around the bounding box for the selected location.

This means that every user in a given neighborhood will be at zero distance to each other (and so the RetroMeet web client will show them as "Very near you"), while a user will see any other user from a nearby neighrborhood at the same distance.

### PostGIS and distances

RetroMeet uses PostGIS for location data, storing each location as a point (again, coming from OSM data as the latitude/longitude from that location, not the bounding box). It uses {% external_link { "text": "WGS 84", "link": "https://epsg.io/4326" } %} to represent the location data and allow for distance queries. This is because we don't want to get stuck on local projections since our users could be looking at users from different countries or even continents.
