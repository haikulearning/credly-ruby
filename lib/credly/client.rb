module Credly
  class Client
    include Credly::Connection
    include Requierable

    attr_accessor :options

    def initialize(args = {})
      @options = Credly.options.merge(args.except(:username, :password))
      if args[:username] && args[:password]
        @options[:access_token] = authenticate(args[:username], args[:password])
      elsif !args[:access_token]
        raise ArgumentError.new("Need either an 'access_token' or 'username' and 'password' parameters")
      end
    end

    def authenticate(username, password)
      connection = new_connection
      connection.basic_auth(username, password)
      resp = connection.post(versioned_path('authenticate'))
      resp = MultiJson.load(resp.body)
      if resp['meta']['status_code'] == 200
        resp['data']['token']
      else
        raise AuthFailed.new("The username or password was invalid\n#{resp}")
      end
    end

    def access_token
      options[:access_token]
    end

    def get(path, params = {}, headers = {})
      super(path, {:access_token => access_token}.merge(params), headers)
    end

    def post(path, params = {}, headers = {})
      super(path, {:access_token => access_token}.merge(params), headers)
    end

    def put(path, params = {}, headers = {})
      super(path, {:access_token => access_token}.merge(params), headers)
    end

    def delete(path, params = {}, headers = {})
      super(path, {:access_token => access_token}.merge(params), headers)
    end

    def base_url
      options[:base_endpoint]
    end

    def badges(id = nil)
      Api::Badges.new(:client => self, :id => id)
    end

    def member_badges(id = nil)
      Api::MemberBadges.new(:client => self, :id => id)
    end

    def members(id = nil)
      Api::Members.new(:client => self, :id => id)
    end

    def me(id = nil)
      Api::Me.new(:client => self, :id => id)
    end

    def badge_builder(id = nil)
      Api::BadgeBuilder.new(:client => self, :id => id)
    end

    def versioned_path(path)
      [options[:version], path].join('/')
    end

  end

  class AuthFailed < StandardError
  end
end