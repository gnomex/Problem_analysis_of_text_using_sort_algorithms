require 'sinatra'
require 'json'
require 'benchmark'

configure do
  set :public_folder, Proc.new { File.join(root, "static") }
  enable :sessions
end

helpers do
	def sort(array)
		@stats = Benchmark.bmbm do |x|
			x.report("Buuble") { @bubble = Algorithms::Sort.bubble_sort array }
			x.report("Comb") { @comb = Algorithms::Sort.comb_sort array }
		    x.report("Selection") { @selection = Algorithms::Sort.selection_sort array }
		    x.report("Heap") { @heap = Algorithms::Sort.heapsort array }
		    x.report("Insertion") { @insertion = Algorithms::Sort.insertion_sort array }
		    x.report("Shell") { @shell = Algorithms::Sort.shell_sort array }
		    x.report("Quick") { @quick = Algorithms::Sort.quicksort array }
			x.report("Merge") { @merge = Algorithms::Sort.mergesort array }
		end
	end

end

get '/' do
  erb :stats
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

	@contents = TextAnalysis.parse_file "./upload/#{@file_name}"

	@frequency = TextAnalysis.frequency @contents

	@distances = TextAnalysis.distances @contents

	erb:analysis
end

error 400..510 do
	'Booooooooooooooom'
end

get '/*' do
	status 405
end