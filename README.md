# OpenApi [![Gem Version](https://badge.fury.io/rb/open_api.svg)](https://badge.fury.io/rb/open_api) [![Build Status](https://travis-ci.org/ngtk/open_api.svg?branch=master)](https://travis-ci.org/ngtk/open_api) [![Maintainability](https://api.codeclimate.com/v1/badges/dc4713a3cb67f6edce65/maintainability)](https://codeclimate.com/github/ngtk/open_api/maintainability) [![Test Coverage](https://api.codeclimate.com/v1/badges/dc4713a3cb67f6edce65/test_coverage)](https://codeclimate.com/github/ngtk/open_api/test_coverage)

`open_api` provides PORO and serializers for OpenAPI and it supports OpenAPI v3.0.1.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'open_api'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install open_api

## Usage
It has two use case:

1. Serializing from PORO to yaml
2. Deserializing yaml to PORO

### Serializing

```rb
spec = OpenApi::Specification.new(
  openapi: "3.0.1",
  info: OpenApi::Info.new(
    title: "Awesome API",
    description: "It provides something awesome",
    version: "1.0.0",
  ),
  paths: OpenApi::Paths.new(
    "/pets": OpenApi::PathItem.new(
      get: OpenApi::Operation.new(
        description: "Returns all pets from the system that the user has access to",
        responses: OpenApi::Responses.new(
          "200": OpenApi::Response.new(
            description: "A list of pets.",
            content: {
              "application/json": OpenApi::MediaType.new(
                schema: OpenApi::Schema.new(
                  type: "array",
                  items: OpenApi::Reference.new(ref: "#/components/schemas/pet"),
                )
              )
            }
          )
        )
      )
    )
  )
)

yaml = OpenApi::Serializers::YamlSerializer.serialize(spec)
File.write("spec.yml", yaml)
```

### Deserializing

```rb
yaml = File.read("spec.yml")
spec = OpenApi::Serializers::YamlSerializer.deserialize(yaml)
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/ngtk/open_api. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the OpenApi project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/ngtk/open_api/blob/master/CODE_OF_CONDUCT.md).
