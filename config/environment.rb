# Set up gems listed in the Gemfile.
# See: http://gembundler.com/bundler_setup.html
#      http://stackoverflow.com/questions/7243486/why-do-you-need-require-bundler-setup
ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../../Gemfile', __FILE__)

require 'bundler/setup' if File.exists?(ENV['BUNDLE_GEMFILE'])

# Require gems we care about
require 'rubygems'

require 'uri'
require 'pathname'

require 'pg'
require 'active_record'
require 'logger'

require 'sinatra'
require "sinatra/reloader" if development?

require 'erb'

require 'byebug'

enable :sessions

# Some helper constants for path-centric logic
APP_ROOT = Pathname.new(File.expand_path('../../', __FILE__))

APP_NAME = APP_ROOT.basename.to_s

# Set up the controllers and helpers
Dir[APP_ROOT.join('app', 'controllers', '*.rb')].each { |file| require file }
Dir[APP_ROOT.join('app', 'helpers', '*.rb')].each { |file| require file }

# Set up the database and models
require APP_ROOT.join('config', 'database')

# Create twitter client
require 'twitter'
$client = Twitter::REST::Client.new do |config|
  config.consumer_key        = "JoPzsiwTYxR8hvejO4K219HB1"
  config.consumer_secret     = "OqTZTjWr9OyT94LnoBGzOdzcqCgUNohhdA2Ti92HeIc47tPpoV"
  config.access_token        = "3015997298-VZlgi15ltOzd6PmorRBfItItF44j9xPE5a61Blw"
  config.access_token_secret = "7yl7B6on7IXuMjue4z9voRe9BeySBODEJXsGV4DZM9Cl6"
end