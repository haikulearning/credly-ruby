#!/usr/bin/env rake

require File.expand_path('../lib/credly/version', __FILE__)

desc "Build"
task "build" do
  system("gem build credly.gemspec")
end

desc "Build and publish the gem"
task :publish => :build do
  tags = `git tag`
  system("git tag #{Credly::VERSION}") unless tags =~ /#{Credly::VERSION}/
  system("gem push credly-#{Credly::VERSION}.gem")
  system("git push --tags")
end

task :release => :publish do
end

task :install_gems do
  system("gem install faraday activesupport multi_json rake pry-debugger json_spec rspec guard-bundler guard-rspec rb-inotify rb-fsevent rb-fchange ruby_gntp faraday fabrication fuubar awesome_print")
end