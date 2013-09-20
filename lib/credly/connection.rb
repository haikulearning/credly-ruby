require 'faraday'
require 'multi_json'

module Credly
  module Connection

    def new_connection(options = {})
      default_options = {
        :headers => {
          :accept       => 'application/json',
          :content_type => 'application/x-www-form-urlencoded',
          :user_agent   => Credly.user_agent,
        }
      }

      Faraday.new(options[:base_url] || self.base_url, default_options) do |builder|
        builder.use Credly::Response::FollowRedirects
        builder.request :multipart
        builder.request :url_encoded

        # builder.use Faraday::Request::Multipart
        # builder.use Faraday::Request::UrlEncoded

        builder.response :logger, ::Logger.new(STDOUT) if self.options[:debugging]

        # builder.response :logger, ::Logger.new(STDOUT), :bodies => { :request => true, :response => false }

        builder.adapter Faraday.default_adapter
      end
    end

    def connection
      @connection ||= new_connection
    end

    def connection=(con)
      @connection = con
    end

    def get(path, params = {}, headers = {})
      request(:get, path, params, headers)
    end

    def post(path, params = {}, headers = {})
      request(:post, path, params, headers)
    end

    def put(path, params = {}, headers = {})
      request(:put, path, params, headers)
    end

    def delete(path, params = {}, headers = {})
      request(:delete, path, params, headers)
    end

    def request(method, path, params, headers)
      response = connection.send(method) do |request|
        case method.to_sym
        when :delete, :get
          request.url(path, params)
        when :post, :put
          request.path = path
          request.body = params unless params.empty?
        end
        request.headers.merge!(headers)
      end
      response.body
    end
  end
end