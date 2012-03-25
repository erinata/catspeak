module Catspeak
	class Cat
		attr_accessor :name

		def initialize(name = '')
			 @name = name
		end
	
		def speak(statement = '')
			#TODO: Make a real translator
			"My Name is #{@name}. And I hear #{statement}."  
		end
		

	end


	class CatLang
		def self.to_cat_lang(statement)
			# NOTE: 

		end



	end
end
