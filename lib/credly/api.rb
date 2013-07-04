require 'forwardable'

module Credly
  class Api
    extend Forwardable

    attr_accessor :client

    def_delegators :@client, :get, :post, :request, :put, :delete, :patch

    def initialize(client)
      @client = client
    end

    private

    def self.endpoint(name)
      define_method name do
        $endpoint_resource = name.to_s if ENV['testing']
        Api::const_get(name.to_s.camelize).new(:client => @client)
      end
    end

    def self.endpoints(*names)
      names.each { |name| endpoint(name) }
    end

    public

    endpoints :badges, :member_badges, :members

  end
end