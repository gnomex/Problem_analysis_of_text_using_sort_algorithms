module TextAnalysis

	#require "rubygems"
    #require './algorithms.rb'
	require "benchmark"	

		
	def self.parse_file(filename)

		@contents = Array.new

		File.open(filename).each_line do |line|
			line.gsub!(/\r\n?/, "\n")
			mapping = line.each_char.to_a
			@contents <<  mapping
		end
		@contents.flatten
	end

	#
	def self.frequency(array)

		dup = Hash.new(0)

		array.each { |letter| dup[letter] += 1}

		return dup
	end

	
	
end