
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

get '/upload' do
	erb:upload
end

post '/upload' do

	file_name = "#{params[:myfile][:filename]}"

	path = "./upload/#{file_name}.#{Time.now}"

	File.open(path, "w") do |f|
    	f.write(params['myfile'][:tempfile].read)
  	end

  	redirect "/analyse/#{file_name}"
end

get '/analyse/:file' do
	@lol = "Looooooooooool #{params[:file]}"
	erb:analysis
end