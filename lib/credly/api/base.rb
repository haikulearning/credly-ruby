
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

      def build_object
        MultiJson.load(@response)
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