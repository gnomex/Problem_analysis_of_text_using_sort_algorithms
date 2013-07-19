class ParseFile

	def self.parse(filename)
		@contents = File.readlines(filename)
	end
		
end