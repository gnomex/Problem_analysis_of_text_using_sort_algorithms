
require 'rubygems'
require 'sinatra'

helpers do

	def file_loaded?

	end

end


configure do
  set :public_folder, Proc.new { File.join(root, "static") }
  enable :sessions
end

get '/' do
  erb :stats
end

get '/showfile'	do
	@contents = File.readlines("lerolero.txt")
	erb :show_contents
end