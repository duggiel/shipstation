## Shipstation

[![Gem Version](https://badge.fury.io/rb/shipstation.svg)](https://badge.fury.io/rb/shipstation)

A Ruby wrapper for the Shipstation API.

[Release Notes](http://release.tomdallimore.com/projects/shipstation)

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
e.g. *config/initializers/shipstation.rb*

If you have a Shipstation Partner ID, you can also supply that to reduce rate
limiting:
```ruby
Shipstation.partner_id = 'abcdef01-2345-6789-0abc-def012345678'
```

## Usage

This gem provides a collection of operations for use within the Shipstation API.

### List

List all records for a resource.

```ruby
Shipstation::Carrier.list
Shipstation::Customer.list
Shipstation::Order.list
Shipstation::Product.list
Shipstation::Shipment.list
Shipstation::Store.list
Shipstation::Warehouse.list
Shipstation::Tag.list
```

### Retrieve

Retrieve a single record of a resource.

```ruby
Shipstation::Customer.retrieve(customer_id)
Shipstation::Order.retrieve(order_id)
Shipstation::Product.retrieve(product_id)
Shipstation::Store.retrieve(store_id)
Shipstation::Warehouse.retrieve(warehouse_id)
```

### Create

Create a single record of a resource.

```ruby
Shipstation::Order.create(order_params)
Shipstation::Warehouse.create(warehouse_params)
```
### Create Bulk

Create a bulk records of a resource.

```ruby
Shipstation::Order.createbulk(order_params)
```

### Update

Update a single record of a resource.

```ruby
Shipstation::Product.update(product_params)
Shipstation::Store.update(store_params)
Shipstation::Warehouse.update(warehouse_params)
```

Apart from the standard CRUD operations, there are also some custom operations for specific use cases.

### Create a new Order Label.

```ruby
Shipstation::Order.create_label(order_label_params)
```

### Void an Order Label.

```ruby
Shipstation::Order.void_label(order_label_params)
```

### Assign Tag to an Order.

```ruby
Shipstation::Order.assign_tag(assign_tag_params)
```

### Remove Tag from an Order.

```ruby
Shipstation::Order.remove_tag(remove_tag_params)
```

### Delete an Order

```ruby
Shipstation::Order.delete(order_id)
```

### Get Shipment Rates
```ruby
Shipstation::Shipment.get_rates(get_rates_params)
```

### Create Shipment Label
```ruby
Shipstation::Shipment.create_label(create_label_params)
```

### List Carrier Services
```ruby
Shipstation::Carrier.list_services(list_services_params)
```

### Susbcribe to Webhook
```ruby
Shipstation::Webhook.subscribe(webhook_params)
```

### Unsusbcribe to Webhook
```ruby
Shipstation::Webhook.unsubscribe(webhook_id)
```

## Versioning

Shipstation Ruby wrapper follows Semantic Versioning 2.0 as defined at
<http://semver.org>.

## How to contribute

* Fork the project
* Create your feature or bug fix
* Add the requried tests for it.
* Commit (do not change version or history)
* Send a pull request against the *development* branch

## Copyright
Copyright (c) 2020 [Tom Dallimore](http://www.tomdallimore.com/?utm_source=shipstation&utm_medium=website&utm_campaign=tomdallimore) ([@tom_dallimore](http://twitter.com/tom_dallimore))
Licenced under the MIT licence.
