module Credly
  attr_accessor :options

  def self.base_endpoint=(endpoint)
    options[:base_endpoint] = endpoint
  end

  def self.base_endpoint
    options[:base_endpoint]
  end

  def self.debugging=(debugging)
    options[:debugging] = debugging
  end

  def self.debugging
    options[:debugging]
  end

  def self.debugging?
    !!options[:debugging]
  end

  def self.user_agent=(user_agent)
    options[:user_agent] = user_agent
  end

  def self.user_agent
    options[:user_agent]
  end

  def self.access_token=(access_token)
    options[:access_token] = access_token
  end

  def self.access_token
    options[:access_token]
  end

  def self.version=(version)
    options[:version] = version
  end

  def self.version
    options[:version]
  end

  def self.base_domain
    options[:base_domain]
  end

  def self.base_domain=(domain)
    options[:base_domain] = domain
  end

  def self.options
    if defined? @@options
      @@options
    else
      @@options = { :base_endpoint => 'https://apistaging2.credly.com',
                    :base_domain   => 'https://staging.credly.com',
                    :access_token  => nil,
                    :version       => 'v0.2',
                    :debugging     => false,
                    :user_agent    => 'credly_ruby_client' }
    end
  end

  def self.configuration
    if block_given?
      yield(self)
    else
      options
    end
  end

end

if defined? Rails
  if Rails::VERSION::MAJOR > 2
    require 'active_support/all'
  else
    require 'active_support'
  end
else
  require 'active_support/all'
end

require 'credly/version'
require 'credly/connection'
require 'credly/response/follow_redirects'
require 'credly/requierable'
require 'credly/client'

require 'credly/api/base'

Dir[File.dirname(__FILE__) + "/credly/api/*"].each {|file| require file unless file == 'base.rb' }