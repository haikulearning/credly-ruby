module Credly
  class Client
    include Credly::Connection
    include Requierable

    attr_accessor :options

    def initialize(options = {})
      @options = Credly.options.merge(options)
    end

    def api
      Api.new(self)
    end

    def authenticate(username, password)
      connection = new_connection
      connection.basic_auth(username, password)
      resp = connection.post(versioned_path('authenticate'))
      resp = MultiJson.load(resp.body)
      if resp['status_code'] == 200
        options[:auth_token] = resp.data['token']
      else
        resp
      end
    end

    def get(path, params = {}, headers = {})
      super(versioned_path(path), {:access_token => options[:auth_token]}.merge(params), headers)
    end

    def post(path, params = {}, headers = {})
      super(versioned_path(path), {:access_token => options[:auth_token]}.merge(params), headers)
    end

    def put(path, params = {}, headers = {})
      super(versioned_path(path), {:access_token => options[:auth_token]}.merge(params), headers)
    end

    def delete(path, params = {}, headers = {})
      super(versioned_path(path), {:access_token => options[:auth_token]}.merge(params), headers)
    end

    def base_url
      options[:base_endpoint]
    end

    private

    def versioned_path(path)
      [options[:version], path].join('/')
    end

  end
end