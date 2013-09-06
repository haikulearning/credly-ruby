# A Ruby client for the Credly API

Credly is an Badging service. This is the the API client for the ruby client. You can find Credly's API at https://apidocs2.credly.com/credly.

## Install

```
gem 'credly'
```

## Quick Start
```ruby
client = Credly::Client.new(access_token: '26287568342')
# Or
client = Credly::Client.new(username: 'whatever', password: 'mypass')

client.badges.all
client.badges.find(1)
client.badges.categories.all
```

All API endpoints are accessible from the client instance. The endpoints methods are named after the remote endpoint. So, for example any action on 'https://apistaging2.credly.com/v0.2/members' will be using `client.members`.

Nested endpoints, like `/members/:id/badges` are also nested in the client

```ruby
client.members(id).badges.all(other_parameter: 'whatever')
```

Check https://github.com/haikulearning/credly-ruby/blob/master/spec/unit/api_spec.rb for examples.


## Configuration

This is how you can configure the default values for Credly:

```ruby
Credly.configuration do |config|
  # These are the default values
  config.base_endpoint = 'apistaging2.credly.com'
  config.version       = 'v0.2'
  config.access_token  = nil
end
```

You can also do:

```ruby
Credly.configuration.base_endpoint = 'apistaging2.credly.com/v0.2/'
Credly.configuration.version       = 'v0.2'
Credly.configuration.access_token  = nil
```

Those options will be the default ones for any `client` you create afterwards. Nonetheless, you can overwrite any of these options; just pass it as an argument when you instantiate the client:

```ruby
client = Credly::Client.new(access_token: '26287568342', base_endpoint: 'apistaging2.credly.com/', version: 'v0.2')
```

## License & Acknowledgments

The MIT License, for full details please see the LICENSE file.
