# VPSA

[![Build Status](https://travis-ci.org/coyosoftware/vpsa.svg?branch=master)](https://travis-ci.org/coyosoftware/vpsa) [![Gem Version](https://badge.fury.io/rb/vpsa.svg)](http://badge.fury.io/rb/vpsa) [![Test Coverage](https://codeclimate.com/github/coyosoftware/vpsa/badges/coverage.svg)](https://codeclimate.com/github/coyosoftware/vpsa) [![Code Climate](https://codeclimate.com/github/coyosoftware/vpsa/badges/gpa.svg)](https://codeclimate.com/github/coyosoftware/vpsa)

This gem simplifies the usage of [VPSA](http://www.vpsa.com.br/) API

For more information regarding the API, visit the [documentation]

## Installation

Add this line to your application's Gemfile:

    gem 'vpsa'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install vpsa

## Usage

Create a new instance of VPSA class passing your access token:

```ruby
	client = Vpsa.new(YOUR_ACCESS_TOKEN)
```	

With the client instance, you can access the following resources:

* Foo (client.foo) **Only creation**
* Bar (client.bar) **Not Implemented Yet**

## Using the resources
### Foo
All resources implement a **create** method.

It can accept a hash with the parameters as described in the API [documentation] or an Entity object that reflects the API fields.

Currently the following entities are implemented:

* [Foo](lib/vpsa/entity/foo.rb)

### Reading the response
All methods return an Vpsa::Client::Response object. This objects contains the following attributes:

```ruby
	response = Vpsa.new(YOUR_ACCESS_TOKEN).foo.create(foo_entity)
	
	response.status			# Contains the status code of the request
	response.payload		# Contains the return data (JSON) of the request
	response.raw_response	# Contains the HTTParty response object
```

## Contributing

1. Fork it ( https://github.com/coyosoftware/vpsa/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

[documentation]: https://github.com/VPSA/api/wiki/
