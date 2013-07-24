module TextAnalysis

	#require "rubygems"
    #require './algorithms.rb'
	require "benchmark"	

		
	def self.parse_file(filename)
		#File.readlines(filename)
		@contents = Array.new

		#valid_symbols = ["a..z\ ´`,.;ç"]

		#p "hello".each_char.to_a
		#oses = %w[lol olo lool loool]
		#p oses.each_with_index { |os, i| puts "Index: #{i} => #{os}" }
		#mapping = oses.each_with_index.map { |os, i| "os.each_char.to_a" }
		#mapping.flatten

		File.open(filename).each_line do |line|
			line.gsub!(/\r\n?/, "\n")
			mapping = line.each_char.to_a
			@contents <<  mapping
		end
		@contents
	end

	def self.distances(contents, char)
		
	end
end