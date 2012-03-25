require 'catspeak/cat'

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
    Catspeak::Cat.new('Kitty').speak('Hello').should == 'Me!M Mow^Mu!Mow~MEOW!!!Me~~Ma'
  end

end
