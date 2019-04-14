require 'catspeak/encrypter'
#require 'Zlib'
	
module Translator
	module NumberLang
		# TODO: consider restructuring the whole Gem. There should be no "NumberLang". 
		# 			Instead there should be a HumanLang, which define "human_to_number" and "number_to_human"
		#       While CatLang also define "cat_to_number" and "cat_to_human"
		# 			And the Cat class simply implement both humanlang and catlang
		#  			Together with the concept of making CatLang module a generic module. There should be 2 generic module of translator. Say "encrypt translator" and "dictionary translator", the HumanLang and and CatLang implement them respectively.

		# TODO: HumanLang class should be English instead. So that future lang can deal with Unicode languages
		
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

	# TODO: should turn this CatLang module into a generic Lang module. 
	# 			Where there are char_dict instead of cat_char_dict ....etc.
	# 			And the CatLang should just overwrite the char_dict files with cat specific dictionary
	# 			The cat specific thing should be specified in the Cat Class, in the Cat class it should include the CatLang to show that it's a cat


	module CatLang
		include NumberLang
		
		def cat_char_dict
			[
				'MEOW','MeOW','MEoW','MEOw','MEow','MeOw','MeoW','Meow',  #8  
				'mEOW','meOW','mEoW','mEOw','mEow','meOw','meoW','meow',	#16 
				'MEOU','MeOU','MEoU','MEOu','MEou','MeOu','MeoU','Meou',	#24 
				'mEOU','meOU','mEoU','mEOu','mEou','meOu','meoU','meou',	#32 
				'MEO' ,'MEo' ,'MeO' ,'Meo' ,'mEO' ,'mEo' ,'meO' ,'meo' ,	#40 
				'MAOW','MaOW','MAoW','MAOw','MAow','MaOw','MaoW','Maow',  #48 
				'mAOW','maOW','mAoW','mAOw','mAow','maOw','maoW','maow',	#56 
				'MAOU','MaOU','MAoU','MAOu','MAou','MaOu','MaoU','Maou',	#64 
				'mAOU','maOU','mAoU','mAOu','mAou','maOu','maoU','maou',	#72 
				'MAO' ,'MAo' ,'MaO' ,'Mao' ,'mAO' ,'mAo' ,'maO' ,'mao' ,	#80 
				'MIAO','MIaO','MIAo','MiAO','MiAo','MiaO','MIao','Miao',  #88 
				'mIAO','mIaO','mIAo','miAO','miAo','miaO','mIao','miao',	#96 
				'MIA' ,'MIa' ,'MiA' ,'Mia' ,'mIA' ,'mIa' ,'miA' ,'mia' ,  #104
				'ME'  ,'Me'  ,'mE'  ,'me'  ,'MA'  ,'Ma'  ,'mA'  ,'ma'  ,  #112
				'MW'  ,'Mw'  ,'mW'  ,'mw'  ,'MU'  ,'Mu'  ,'mU'  ,'mu'  ,  #120
				'MI'  ,'Mi'  ,'mI'  ,'mi'  ,'MM'  ,'Mm'  ,'mM'  ,'mm'  ,  #128
				'MEE' ,'MEe' ,'MeE' ,'Mee' ,'mEE' ,'mEe' ,'meE' ,'mee' ,	#136
				'MAW' ,'MAw' ,'MaW' ,'Maw' ,'mAW' ,'mAw' ,'maW' ,'maw' ,	#144
				'EE'  ,'Ee'  ,'eE'  ,'ee'  ,'II'  ,'Ii'  ,'iI'  ,'ii'  ,  #152
				'I'   ,'i'   ,'E'   ,'e'   ,'M'   ,'m'   ,'A'   ,'a'   ,  #160
				'MOW' ,'MoW' ,'MOw' ,'Mow' ,'mOW' ,'moW' ,'mOw' ,'mow' ,	#168
				'MImi','Mimi','mImi','mimi','MIMi','MiMi','mIMi','miMi',  #176
				'MImI','MimI','mImI','mimI','MIMI','MiMI','mIMI','miMI',  #184
				'MEA' ,'MEa' ,'MeA' ,'Mea' ,'mEA' ,'mEa' ,'meA' ,'mea' ,	#192
				'MIU' ,'MIu' ,'MiU' ,'Miu' ,'mIU' ,'mIu' ,'miU' ,'miu' ,  #200
				'MAAO','MAAo','MaAO','MaAo','mAAO','mAAo','maAO','maAo',	#208
				'MAaO','MAao','MaaO','Maao','mAaO','mAao','maaO','maao',	#216
				'MEAO','MEaO','MEAo','MeAO','MeAo','MeaO','MEao','Meao',  #224
				'mEAO','mEaO','mEAo','meAO','meAo','meaO','mEao','meao',	#232 
				'MOO' ,'MOo' ,'MoO' ,'Moo' ,'mOO' ,'mOo' ,'moO' ,'moo' ,	#240
				'UM'  ,'Um'  ,'uM'  ,'um'  ,'MUM' ,'Mum' ,'mum' ,'MeeoW', #248
				'MEU' ,'Meu' ,'meu' ,'MEW' ,'Mew' ,'mew' ,'Meeow','meeow' #256 

			]
		end

		def cat_tone_dict
			[
				' '   ,'  '  ,'   ',
				'.'   ,'. '  ,'...'  ,'... ',' ...',' ... ',
				'??~','!!~' ,'~!!','~??','?~?','!~!',' ??~',' !!~' ,' ~!!',' ~??',' ?~?',' !~!',
				'^','^^','^ ','^^ ','~^','~^ ','~~^','~~^ ','~~?','~~? ','~~!','~~! ',
				' ~~^',' ~~^ ',' ~~?',' ~~? ',' ~~!',' ~~! ',' ~^',' ~^ ',
				',',', ',
				':',': ',
				'!  ','~  ','-  ','?  ','.  ',',  ',':  ',
				' !',' ~',' -',' ?',' .',' ,',' :',
				' ! ',' ~ ',' - ',' ? ',' . ',' , ',' : ',
				' !!',' ??',' ~~',
				"'"," '","' ",
				'!'   ,'!!'  ,'!!!' ,'!!!!','! '   ,'!! '  ,'!!! ' ,'!!!! ',
				'~'   ,'~~'  ,'~~~' ,'~~~~','~ '   ,'~~ '  ,'~~~ ' ,'~~~~ ',
				'-'   ,'--'  ,'---' ,'----','- '   ,'-- '  ,'--- ' ,'---- ',
				'?'   ,'??'  ,'???' ,'????','? '   ,'?? '  ,'??? ' ,'???? ',
				"!!!?", "!!?!", "!!??", "!?!!", "!?!?", "!??!", "!???",
				"?!!!", "?!!?", "?!?!", "?!??", "??!!", "??!?", "???!",
				"!!!? ", "!!?! ", "!!?? ", "!?!! ", "!?!? ", "!??! ", "!??? ",
				"?!!! ", "?!!? ", "?!?! ", "?!?? ", "??!! ", "??!? ", "???! ",
				"~~~?", "~~??", "~?~?", "~???", "?~~~", "?~~?", "?~?~", "?~??", "??~~", "??~?", "???~",
				"~~~? ", "~~?? ", "~?~? ", "~??? ", "?~~~ ", "?~~? ", "?~?~ ", "?~?? ", "??~~ ", "??~? ", "???~ ",
				"~~~!", "~~!!", "~!~!", "~!!!", "!~~~", "!~~!", "!~!~", "!~!!", "!!~~", "!!~!", "!!!~",
				"~~~! ", "~~!! ", "~!~! ", "~!!! ", "!~~~ ", "!~~! ", "!~!~ ", "!~!! ", "!!~~ ", "!!~! ", "!!!~ ",
				"---?", "--??", "-?-?", "-???", "?---", "?-?-", "?-??", "??-?", "???-",
				"---!", "--!!", "-!-!", "-!!!", "!---", "!-!-", "!-!!", "!!-!", "!!!-",
				"---? ", "--?? ", "-?-? ", "-??? ", "?--- ", "?-?- ", "?-?? ", "??-? ", "???- ",
				"---! ", "--!! ", "-!-! ", "-!!! ", "!--- ", "!-!- ", "!-!! ", "!!-! ", "!!!- ",
				'=(>.<)=', '-(>.<)-','=(".")=','-(".")-',"=('.')=","-('.')-", 
				'\(>.<)/', '\(".")/','=(^.^)=','-(^.^)-','\(^.^)/','=(~.~)=', '-(~.~)-', '\(~.~)/',
				'=(*.*)=', '-(*.*)-', '\(*.*)/','=(`.`)=','-(`.`)-','\(`.`)/','=(-.-)=','\(-.-)/',
				'=(>.<)= ', '-(>.<)- ','=(".")= ','-(".")- ',"=('.')= ","-('.')- ", 
				'\(>.<)/ ', '\(".")/ ','=(^.^)= ','-(^.^)- ','\(^.^)/ ','=(~.~)= ', '-(~.~)- ', '\(~.~)/ ',
				'=(*.*)= ', '-(*.*)- ', '\(*.*)/ ','=(`.`)= ','-(`.`)- ','\(`.`)/ ','=(-.-)= ','\(-.-)/ '
 			] 
			
		end

		def number_to_cat(number_text)
			cat_text = ''
			number_text.length.times do |i|
				if (i.even?)
					cat_text = cat_text + cat_char_dict[number_text[i]]
				else
					cat_text = cat_text + cat_tone_dict[number_text[i]]
				end
			end
			cat_text
		end

		def cat_to_number(cat_text)
			number_text = decompose(cat_text)
			number_text.each_index do |i| 
				if (i.even?)
					number_text[i] = cat_char_dict.index(number_text[i])
				else
					number_text[i] = cat_tone_dict.index(number_text[i])
				end
			end
			number_text
		end

		def human_to_cat(name, human_text)
			number_text = human_to_number(name, human_text)
			number_to_cat(number_text)
		end

		def cat_to_human(name, cat_text)
			number_text = cat_to_number(cat_text)
			number_to_human(name, number_text)
		end

		def decompose(statement)
			# TODO: should get the regular expression from the dictionary. Simply get all the characters from it and get the unique characters

			statement.scan(/(\w+)?(\W+)?/).flatten.compact
			#a1 = statement.split(/\W+/)
			#a2 = statement.split(/\w+/)
			#a2.delete_at(0)
			#a2.each_index do |i| 
			#	a1.insert(2*i+1,a2[i])
			#end
			#a1

			#a3 = []
			#a1.each_index do |i| 
			#	a3 = a3+Array.new(1,a1[i])
			#	if (!a2[i].nil?) 
			#		a3 = a3+Array.new(1,a2[i])
			#	end
			#end
			#a3
		end

	end
end