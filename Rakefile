require 'rubygems'
require 'bundler/setup'
require "bundler/gem_tasks"

task :default => :test

task :test do
  require 'bacon'
  
  ENV['COVERAGE'] = "1"
  
  Dir[File.expand_path('../specs/**/*_spec.rb', __FILE__)].each do |file|
    puts "File: #{file}:"
    load(file)
  end
  
end

