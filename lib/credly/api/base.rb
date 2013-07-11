
module Credly
  class Api
    class Base
      extend Forwardable
      include Requierable

      attr_accessor :response

      def initialize(options = {})
        @client = options[:client]
      end

      def build_object
        return MultiJson.load(@response)
      end

      def before_request(*args)
      end

      def get(*args)
        before_request(*args)
        @response = @client.get(*args)
        build_object
      end

      def post(*args)
        before_request(*args)
        @response = @client.post(*args)
        build_object
      end

      def put(*args)
        before_request(*args)
        @response = @client.put(*args)
        build_object
      end

      def delete(*args)
        before_request(*args)
        @response = @client.delet(*args)
        build_object
      end

      def patch(*args)
        before_request(*args)
        @response = @client.patch(*args)
        build_object
      end
    end
  end
end