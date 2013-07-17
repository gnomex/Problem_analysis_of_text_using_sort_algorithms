
require 'rubygems'
require 'sinatra'

configure do
  set :public_folder, Proc.new { File.join(root, "static") }
  enable :sessions
end

get '/' do
  erb :stats
end

get '/upload' do
	erb :upload
end

post '/upload' do
	erb "#{params}"
end