
require 'rubygems'
require 'sinatra'
require './lib/text_analysis.rb'

configure do
  set :public_folder, Proc.new { File.join(root, "static") }
  enable :sessions
end

get '/' do
  erb :stats
end

get '/showfile'	do
	@contents = TextAnalysis.parse_file "./simpletest.txt"
	erb:show_file
end

get '/upload' do
	erb:upload
end

post '/upload' do

	file_name = "#{params[:myfile][:filename]}"

	path = "./upload/#{file_name}"

	File.open(path, "w") do |f|
    	f.write(params['myfile'][:tempfile].read)
  	end

  	redirect "/analyse/#{file_name}"
end

get '/analyse/:file' do
	@lol = "#{params[:file]}"
	erb:analysis
end

error do
  'Sorry there was a nasty error - ' 
end

error 400..510 do
	'Boom'
end

get '/*' do
	status 405
end