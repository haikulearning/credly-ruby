require_relative '../lib/credly'
require 'awesome_print'

ENV['testing'] = 'true'

RSpec.configure do |config|

  Dir[File.dirname(__FILE__) + "/support/*.rb"].each {|file| require file }

  config.filter_run :focus => true
  config.run_all_when_everything_filtered = true
  config.treat_symbols_as_metadata_keys_with_true_values = true

  config.order = "random"
end

def expect_api_call(type, url, *args)
  if ENV['HIT_SERVER']
    Credly::Client.any_instance.should_receive(type).with(Credly.version + '/' + url, *args).and_call_original
  else
    Credly::Client.any_instance.should_receive(type).with(Credly.version + '/' + url, *args).and_return({ test: "Set ENV['HIT_SERVER'] if you wish to hit the real server and get a real response. This is just being mocked at the moment"}.to_json)
  end

end