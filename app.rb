
require 'rubygems'
require 'sinatra'
require 'json'
require './lib/text_analysis.rb'

configure do
  set :public_folder, Proc.new { File.join(root, "static") }
  enable :sessions
end

helpers do
	def say_hello
		"Funfoooooooooooooooooooo"
	end


end

get '/' do
  erb :stats
end

get '/showfile'	do
	@contents = TextAnalysis.parse_file "./LICENSE.txt"
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

	@file_name = params[:file]

	contents = TextAnalysis.parse_file "./upload/#{@file_name}"

	@distances = TextAnalysis.frequency contents

	erb:analysis
end

error 400..510 do
	'Booooooooooooooom'
end

get '/*' do
	status 405
end