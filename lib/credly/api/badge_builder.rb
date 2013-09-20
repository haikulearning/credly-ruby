module Credly
  class Api
    class BadgeBuilder < Base
      def initialize(options = {})
        super
        @client = @client.dup
        @client.connection = @client.new_connection(:base_url => 'https://staging.credly.com')
      end

      def token
        post("badge-builder/code", { 'access_token' => @client.access_token })
      end

      def versioned_path(path)
        path
      end

    end
  end
end