require 'catspeak'

describe 'Cat' do	
  it "should have a name" do
    Catspeak::Cat.new().should respond_to :name
  end

  it "can be named" do
    Catspeak::Cat.new('Kitty').name.should eq('Kitty')
  end

  it "should speak" do
    Catspeak::Cat.new('Kitty').should respond_to :speak
  end

  it "should speak something meaningful" do
    Catspeak::Cat.new('Kitty').speak('Hello').should == "My Name is Kitty. And I hear Hello."
  end

end

describe "Catspeak" do	
	include Catspeak

  it "should create cats" do    
    cat().should be_an_instance_of Catspeak::Cat
  end

end

describe "CatLang" do
#  it "should response to get count" do
#    Catspeak::CatLang.new().get_count('','').should respond_to :get_count
#  end
#
#  it "should get correct count" do
#    Catspeak::CatLang.new().get_count('aaaaa','a').should == 'a,1,2,3,4,5'
#  end
end