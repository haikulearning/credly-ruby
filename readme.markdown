# A Ruby client for the Credly API

Credly is an Badging service. This is the the API client for the ruby client. You can find Credly's API at https://apidocs2.credly.com/credly.

# Configuration

This is how you can configure the default values for Credly:

```ruby
Credly.configuration do |config|
  # These are the default values
  config.base_endpoint = 'apistaging2.credly.com'
  config.version       = 'v0.2'
  config.auth_token    = nil
end
```

You can also:

```ruby
Credly.configuration.base_endpoint = 'apistaging2.credly.com/v0.2/'
Credly.configuration.version       = 'v0.2'
Credly.configuration.auth_token    = nil
```

Those options will be the default ones for any `client.api` you create afterwards. Nonetheless, you can overwrite any of these options; just pass it as an argument when you instantiate the client:

```ruby
client = client.api.new(auth_token: '26287568342')

```

Then you instantiate a client and use it to make calls:
```ruby
client = client.api.new()

client.api.badges.all
=> #<OpenStruct
      meta={"status_code"=>200, "status"=>"OK", "message"=>"", "more_info"=>nil},
      data=[
        { "id"=>1003,
          "title"=>"asadas",
          "short_description"=>"asdasda",
          "image_url"=>"https://credlyapp.s3.amazonaws.com/badges/6f7791d21e13ca7409146c2343fdf28d.png",
          "is_giveable"=>false,
          "created_at"=>"Thu, 04 Jul 2013 06:33:43 -0400",
          "creator_id"=>147,
          "resources"=>{"url"=>"https://apistaging2.credly.com/v0.2/badges/1003"}},

        { "id"=>1002,
          "title"=>"asadas",
          "short_description"=>"asdasda",
          "image_url"=>"https://credlyapp.s3.amazonaws.com/badges/6f7791d21e13ca7409146c2343fdf28d.png",
          "is_giveable"=>false,
          "created_at"=>"Thu, 04 Jul 2013 06:31:46 -0400",
          "creator_id"=>147,
          "resources"=>{"url"=>"https://apistaging2.credly.com/v0.2/badges/1002"}}
      ]
    >

```

All API endpoints are accessible from `client.api`. The endpoints methods are named after the remote endpoint. So, for example any action on 'https://apistaging2.credly.com/v0.2/members' will be using `client.api.members`.

Nested endpoints, like `/members/:id/badges` are also nested in the client

```ruby
client.api.members.badges
```

In those cases, the `id` will be the first parameter on the method, as in:
```ruby
client.api.members.badges.all(1, { other_parameter: 'whatever' })
```

Check https://github.com/haikulearning/credly-ruby/blob/master/spec/unit/api_spec.rb for examples.