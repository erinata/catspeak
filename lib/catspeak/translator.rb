require 'catspeak/encrypter'
#require 'Zlib'
	
module Translator
	module NumberLang
		def human_to_number(name, human_text)
			number_text = human_text
			#number_text = Zlib::deflate(human_text, 1)
			number_text = Encrypter.encrypt(name, number_text)
			#number_text = Zlib::deflate(number_text, 1)
			number_text = number_text.bytes.to_a
			number_text
		end
		

		def number_to_human(name, number_text)
			human_text = ''
			number_text.each {|i| human_text = human_text + i.chr}
			#human_text = Zlib::inflate(human_text)
			human_text = Encrypter.decrypt(name,human_text)
			#human_text = Zlib::inflate(human_text)
			human_text
		end

	end

	module CatLang
		include NumberLang
		
		def cat_char
			'M'
		end 

		def cat_dict
			[' ', 
			 'eow','eeow','eou','e','ow','ew','eu','eeu','eew','eaou',
			 'eow ','eeow ','eou ','e ','ow ','ew ','eu ','eeu ','eew ','eaou ',
			 'eow!','eeow!','eou!','e!','ow!','ew!','eu!','eeu!','eew!','eaou!',
			 'eow! ','eou! ','e! ','ow! ','ew! ','eu! ','eeu! ','eew! ','~~~','~~~ ',
			 'eow^','eou^','e^','ow^','ew^','eu^','eeu^','eew^','eow^ ','e^ ',
			 'eow~','eeow~','eou~','e~','ow~','ew~','eu~','eeu~','eew~','eaou~',
			 'ow^ ','ew^ ','eu^ ','eeu^ ','eew^ ','^^','^^ ','o^^','e^^','a^^',
			 '?','~','~~', '??', '~~ ','?? ','?!','?! ','!?','!? ',
			 'meou','me','mow','mew','meu','meew','me ','mow ','mew ','meu ',
			 'oo','oe','eo','ou','u','uu','ee','eee','a','ea',
			 'oo ','oe ','eo ','ou ','u ','uu ','ee ','eee ','a ','ea ',
			 'oo!','oe!','eo!','ou!','u!','uu!','ee!','eee!','a!','ea!',
			 'oo! ','oe! ','eo! ','ou! ','u! ','uu! ','ee! ','eee! ','a! ','ea! ',
			 'oo^','ee^','eee^','a^','ea^', 'oo^ ','ee^ ','eee^ ','a^ ','ea^ ',
			 'oo~','ee~','eee~','a~','ea~', 'aao', 'aao ','aao!', 'aao! ','aao!! ',
			 'eow  ','eow!  ','eow^  ','eou  ','eou!  ','eou^  ','!','^','! ','^ ',
			 'eeou','eeou!','eeou~','eeou?','eeea','eeea!','eeea?', 'a?','a? ','a!?',
			 'eow!!','eow!! ','eow!!!','eow!!! ','eow^^','eow^^ ','e!!','e!! ','e!!!','e!!! ',
			 'eoW','eoW ','eoW!','eoW! ','eoW!!','eoW!! ','eoW?','eoW? ','eoW^','eoW^ ',
			 'EOW','EOW ','EOW!','EOW! ','EOW!!','EOW!! ','EOW!!!','EOW!!! ','EEOW', 'EEOW!',
			 'EEOW ', 'EEOW! ','EEOW!!','EEOW!! ','eow?!', 'eow!?','eow?! ', 'eow!? ','eoW!?','eoW?!',
			 'E','EE','EEE','E! ','EE! ','eeeOW','eeeOW ','eeeOW!','eeeOW! ','O!',
			 'eeeeOW','eeeeOW ','eeeeOW!','eeeeOW! ','OO!','OO!!','OO! ','OO!! ','eoW!? ','eoW?! ',
			 'ao','ao ','ao!','ao! ','ao^','ao^ ','AO','AO!','AO ','AO! ',
			 'eow   ','eow    ','EOW  ','EOW!  ','EOW!!  ','EOW!!!  ','e~~','ea~~','o~~','eo~~',
			 'm','mm','mw','meow','meow ']	
		end

		def number_to_cat(number_text)
			cat_text = ''
			number_text.each {|i| cat_text = cat_text + cat_char + cat_dict[i] }
			cat_text
		end

		def cat_to_number(cat_text)
			number_text = cat_text.split(cat_char)
			number_text.delete_at(0)
			number_text.each_index {|i| number_text[i] = cat_dict.index(number_text[i])}
			number_text
		end

		def human_to_cat(name, human_text)
			number_text = human_to_number(name, human_text)
			cat_text = number_to_cat(number_text)
		end

		def cat_to_human(name, cat_text)
			number_text = cat_to_number(cat_text)
			number_to_human(name, number_text)
		end

	end
end