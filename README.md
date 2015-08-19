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

* Classes de Clientes (client.client_classes) **Listing and finding**
* Limite de Créditos (client.credit_limits) ** Listing and block history **
* Lançamentos Padrões (client.default_entries) **Listing and finding**
* Entidades (client.entities) **Listing and finding**
* Configuração de crédito (client.installments) **Saving and information**
* Pedidos de venda (client.orders) **Listing and finding**
* Provisões (client.provisions) **Only Creation**
* Contas a Receber (client.receipts) **Listing and finding**
* Histórico de Vendas (client.sales_history) **Finding and more details **
* Terceiros (client.third_parties) **Listing, finding, creation, credit limit information, credit limit updating, blocking/unblocking credit**
* Dados Login (client.user_data)

## Using the resources
### Listing
All resources implement a **list** method.

It can accept an Entity object that reflects the searchable API fields.

Currently the following entities are implemented:

* [Terceiros](lib/vpsa/searcher/administrative/third_party_searcher.rb)
* [Entidades](lib/vpsa/searcher/administrative/entity_searcher.rb)
* [Limite de Crédito](lib/vpsa/searcher/commercial/credit_limit_searcher.rb)
* [Lançamentos Padrões](lib/vpsa/searcher/financial/default_entry_searcher.rb)
* [Contas a Receber](lib/vpsa/searcher/financial/receipt_searcher.rb)
* [Classes de Clientes](lib/vpsa/searcher/operational/client_class_searcher.rb)
* [Pedidos de Venda](lib/vpsa/searcher/operational/order_searcher.rb)

### Finding
All resources implement a **find** method.

It finds the resource with the passed ID.

```ruby
	Vpsa.new(YOUR_ACCESS_TOKEN).third_parties.find(4)
```

### Creation
Some resources implement a **create** method.

It creates a new resource base on the information passed via Hash.

```ruby
	Vpsa.new(YOUR_ACCESS_TOKEN).provisions.create({:"idLancamentoPadrao" => 3, :"idEntidade" => 1, :"idTerceiro" => 15, :"data" => "21-10-2012", :"valor" =>123.40, :"historico" => "histórico da provisão"})
```

### Getting User Data
You can get the token owner information by calling the following method:

```ruby
	Vpsa.new(YOUR_ACCESS_TOKEN).user_data.get
```

### Reading the response
All methods return a Vpsa::Client::Response object. This object contains the following attributes:

```ruby
	response = Vpsa.new(YOUR_ACCESS_TOKEN).third_parties.list
	
	response.status			   # Contains the status code of the request
	response.payload		   # Contains the return data (JSON) of the request
	response.raw_response	 # Contains the HTTParty response object
```

## Contributing

1. Fork it ( https://github.com/coyosoftware/vpsa/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

[documentation]: https://github.com/VPSA/api/wiki/
