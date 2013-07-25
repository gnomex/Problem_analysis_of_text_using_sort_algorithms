# require "bundler"
require "bundler/setup"
Bundler.require(:default)

if Sinatra::Base.development?
	Bundler.require(:console, :development, ENV.fetch("RACK_ENV", :development))
end

require File.expand_path("../environment", __FILE__)