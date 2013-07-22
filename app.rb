
require 'rubygems'
require 'sinatra'
require './lib/text_analysis.rb'

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
	@contents = TextAnalysis.parse_file "lerolero.txt"
	erb:show_file

end