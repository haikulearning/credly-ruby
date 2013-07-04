guard 'rspec', :cli => "--color --format Fuubar" do
  watch(%r{^lib/(.+)\.rb$})     { |m| "spec" }
  watch(%r{^spec/(.+)\.rb$})
  watch('spec/spec_helper.rb')  { "spec" }
end