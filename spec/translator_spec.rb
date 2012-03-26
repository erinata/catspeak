require 'catspeak\Translator'

describe "NumberLang" do
	include Translator::NumberLang
	it "should translate human lang to number lang" do
	  #human_to_number("Kitty","Hello").should == [120, 1, 147, 246, 154, 225, 59, 249, 211, 171, 211, 61, 235, 118, 78, 153, 145, 184, 240, 24, 0, 73, 199, 9, 108]
	  human_to_number("Kitty","Hello").should == [24, 0, 44, 115, 55, 197, 247, 99]
	end

	it "should translate number lang to human lang" do
	  #number_to_human("Kitty",[120, 1, 147, 246, 154, 225, 59, 249, 211, 171, 211, 61, 235, 118, 78, 153, 145, 184, 240, 24, 0, 73, 199, 9, 108]).should == "Hello"
	  number_to_human("Kitty",[24, 0, 44, 115, 55, 197, 247, 99]).should == "Hello"
	end
end

describe "CatLang" do
	include Translator::CatLang

	it "should translate cat lang to number lang" do
		cat_to_number('MI  ee').should == [120, 1, 147]
	end

	it "should translate number lang to cat lang" do
	  number_to_cat([120, 1, 147]).should == 'MI  ee'
	end

	it "should translate human lang to cat lang" do
	  human_to_cat("Kitty","Hello").should == 'mEOU MAow?~?~maow!---MeeoW?!!! '
	end

	it "should translate cat lang to human lang" do
	  cat_to_human("Kitty",'mEOU MAow?~?~maow!---MeeoW?!!! ').should == "Hello"
	end

	it "should be consistent in translating betwen cat and human lang" do
	  cat_to_human("Kitty", human_to_cat("Kitty",'How are you doing?')).should == 'How are you doing?'
	end

	it "should have char dictionary with length 256" do
	  cat_char_dict.length.should eq(256)
	end

	it "should have char dictionary with unique words" do
	  cat_char_dict.uniq.should eq(cat_char_dict)
	end

	it "should have tone dictionary with length 256" do
	  cat_tone_dict.length.should eq(256)
	end

	it "should have tone dictionary with unique words" do
	  cat_tone_dict.uniq.should eq(cat_tone_dict)
	end

	it "should decompose array correctly" do
	  decompose('Meow!!Mea ? Mi^^ Moo~~~Meow~Maao ***').should == ['Meow','!!','Mea',' ? ','Mi','^^ ','Moo','~~~','Meow','~','Maao',' ***']
	end

	it "should decompose array with odd index correctly" do
	  decompose('Meow!!Mea ? Mi^^ Moo~~~Meow~Maao').should == ['Meow','!!','Mea',' ? ','Mi','^^ ','Moo','~~~','Meow','~','Maao']
	end

end