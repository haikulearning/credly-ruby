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