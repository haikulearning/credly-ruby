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
  system("gem push")
end

task :release => :publish do
end

task :install_gems do
  # Used when testing in 1.8.6, where bundler is not available.
  system("gem install faraday activesupport multi_json rake pry-debugger json_spec rspec guard-bundler guard-rspec rb-inotify rb-fsevent rb-fchange ruby_gntp faraday fabrication fuubar awesome_print")
end