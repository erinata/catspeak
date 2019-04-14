require 'catspeak/translator'

# TODO: add unicode spec
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
		
		def listen(statement = '')
			cat_to_human(@name,statement)
		end

	end
end
