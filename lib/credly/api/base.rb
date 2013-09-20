module Credly
  class Api
    class Base
      extend Forwardable
      include Requierable

      attr_accessor :response
      attr_accessor :id

      def initialize(options = {})
        @client = options.delete(:client)
        options.each_pair do |key, value|
          if self.respond_to?("#{key}=")
            self.send("#{key}=", value)
          end
        end
      end

      def after_request(*args)
        build_object
      end

      def before_request(*args)
      end

      def versioned_path(path)
        [@client.options[:version], path].join('/')
      end

      def build_object
        MultiJson.load(@response)
      end

      def get(*args)
        args[0] = versioned_path(args[0])
        before_request(*args)
        @response = @client.get(*args)
        after_request(*args)
      end

      def post(*args)
        args[0] = versioned_path(args[0])
        before_request(*args)
        @response = @client.post(*args)
        after_request(*args)
      end

      def put(*args)
        args[0] = versioned_path(args[0])
        before_request(*args)
        @response = @client.put(*args)
        after_request(*args)
      end

      def delete(*args)
        args[0] = versioned_path(args[0])
        before_request(*args)
        @response = @client.delet(*args)
        after_request(*args)
      end

      def patch(*args)
        args[0] = versioned_path(args[0])
        before_request(*args)
        @response = @client.patch(*args)
        after_request(*args)
      end
    end
  end
end