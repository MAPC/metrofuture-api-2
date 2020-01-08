# README

# METRO FUTURE IN ACTION API V2

* This version of the API is based on a 'triage' effort to revive the legacy app.

* The app is in 2 parts, Client and API.

* The client app is in Backbone.js and it references this API

* Client is here:  `https://github.com/MAPC/metrofuture-client`

* This API has static JSON data which is imported via the rake task: `rails db:seed`

# To set up and run this API:

use Ruby version: 2.6.3

`$ bundle install`

`$ rails db:create`

`$ rails db:migrate`

`$ rails db:seed`  (Note: this takes awhile, let it run)

start the API:
`$ rails s`

To use this API from the client app, edit the API Endpoint in `app/scripts/main.js`

change:
```
  //API Endpoint
  MfiaClient.API = "https://metrofutureapi.mapc.org"
```

to:
```
  //API Endpoint
  MfiaClient.API = "http://127.0.0.1:3000"
```
