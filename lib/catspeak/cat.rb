module Catspeak
	class Cat
		attr_accessor :name
	
		def initialize(name)
			@name = name
		end
	
		def speak(statement)
			"My Name is #{@name}. And I hear #{statement}."
		end
	
	end
end
