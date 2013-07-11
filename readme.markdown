# A Ruby client for the Credly API

Credly is an Badging service. This is the the API client for the ruby client. You can find Credly's API at https://apidocs2.credly.com/credly.

# Configuration

This is how you can configure the default values for Credly:

```ruby
Credly.configuration do |config|
  # These are the default values
  config.base_endpoint = 'apistaging2.credly.com'
  config.version       = 'v0.2'
  config.access_token  = nil
end
```

You can also:

```ruby
Credly.configuration.base_endpoint = 'apistaging2.credly.com/v0.2/'
Credly.configuration.version       = 'v0.2'
Credly.configuration.access_token  = nil
```

Those options will be the default ones for any `client.api` you create afterwards. Nonetheless, you can overwrite any of these options; just pass it as an argument when you instantiate the client:

```ruby
client = Credly::Client.new(access_token: '26287568342')

```

Then you instantiate a client and use it to make calls:
```ruby
client = client.api.new()

client.badges.all
{
      "meta" => {
        "status_code" => 200,
             "status" => "OK",
            "message" => "",
          "more_info" => nil
    },
      "data" => [
        [0] {
                           "id" => 1003,
                        "title" => "asadas",
            "short_description" => "asdasda",
                    "image_url" => "https://credlyapp.s3.amazonaws.com/badges/6f7791d21e13ca7409146c2343fdf28d.png",
                  "is_giveable" => false,
                   "created_at" => "Thu, 04 Jul 2013 06:33:43 -0400",
                   "creator_id" => 147,
                    "resources" => {
                "url" => "https://apistaging2.credly.com/v0.2/badges/1003"
            }
        }
      ]
}
```

All API endpoints are accessible from the client instance. The endpoints methods are named after the remote endpoint. So, for example any action on 'https://apistaging2.credly.com/v0.2/members' will be using `client.members`.

Nested endpoints, like `/members/:id/badges` are also nested in the client

```ruby
client.members.badges
```

In those cases, the `id` will be the first parameter on the method, as in:
```ruby
client.members.badges.all(1, { other_parameter: 'whatever' })
```

Check https://github.com/haikulearning/credly-ruby/blob/master/spec/unit/api_spec.rb for examples.

The MIT License (MIT)

Copyright (c) 2013 Gonzalo Rodríguez-Baltanás Díaz, Haiku Learning Systems

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.