require 'catspeak/translator'


module Catspeak
	
	class Cat
		include Translator::CatLang

		attr_accessor :name

		def initialize(name = '')
			 @name = name
		end
	
		def speak(statement = '')
			human_to_cat(@name,statement)
		end
		

	end


	
end
