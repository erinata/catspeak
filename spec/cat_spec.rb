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

  it "should speak in cat lang" do
    Catspeak::Cat.new('Kitty').speak('Hello').should == 'MM M^Mu!M~MEOW!!!Mi? Ma'
  end

  it "should understand cat lang" do
    Catspeak::Cat.new('Kitty').hear('MM M^Mu!M~MEOW!!!Mi? Ma').should == 'Hello'
  end

end
