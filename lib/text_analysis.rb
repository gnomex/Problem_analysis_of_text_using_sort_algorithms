module TextAnalysis
	#require "algorithms.rb"
	require "benchmark"

	def self.parse_file(filename)
		#File.readlines(filename)
		@contents = Array.new

		line_num=0
		File.open(filename).each_line do |line|
			line.gsub!(/\r\n?/, "\n")
			@contents <<  { "#{line_num}" => "#{line}" }	
			line_num += 1
		end

		return @contents
	end
end