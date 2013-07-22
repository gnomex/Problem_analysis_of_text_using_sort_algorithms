module TextAnalysis

	#require "rubygems"
    #require './algorithms.rb'
	require "benchmark"	

	class TextAnalysis
		def initialize(args)
			
		end
		
	end

		
	def self.parse_file
		#File.readlines(filename)
		@contents = Array.new

		File.open(filename).each_line do |line|
			line.gsub!(/\r\n?/, "\n")
			@contents <<  line	
		end
	end

end