## Overview

A Ruby wrapper for the Shipstation API.

[Release Notes](http://release.tomdallimore.com/projects/shipstation)

*Please note, this gem is currently under construction. Use at your own risk when deploying to a production environment!*

## Installation

Add module to your Gemfile:

```ruby
gem 'shipstation'
```

Then run bundle to install the Gem:

```sh
bundle install
```

Set up an initializer file with your Shipstation API keys:

```ruby
Shipstation.username  = 'shipstation_api_key'
Shipstation.password  = 'shipstation_api_secret'
```

## Usage

Get all records for a source:

```ruby
Shipstation::Carrier.list
Shipstation::Customer.list
Shipstation::Order.list
Shipstation::Product.list
Shipstation::Shipment.list
Shipstation::Store.list
Shipstation::Warehouse.list
```

Create a new Order:

```ruby
Shipstation::Order.create(order_params)
```

Create a new Order Label:

```ruby
Shipstation::Order.create_label(order_label_params)
```

Create a new Warehouse:
```ruby
ShipStation::Warehouse.create(warehouse_params)
```

## Versioning

Trado PayPal module follows Semantic Versioning 2.0 as defined at
<http://semver.org>.

## How to contribute

* Fork the project
* Create your feature or bug fix
* Add the requried tests for it.
* Commit (do not change version or history)
* Send a pull request against the *development* branch

## Copyright
Copyright (c) 2016 [Tom Dallimore](http://www.tomdallimore.com/?utm_source=shipstation&utm_medium=website&utm_campaign=tomdallimore) ([@tom_dallimore](http://twitter.com/tom_dallimore))  
Licenced under the MIT licence.

