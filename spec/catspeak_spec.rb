require 'catspeak'

describe "Catspeak" do	
	include Catspeak

  it "should create cats" do    
    cat().should be_an_instance_of Catspeak::Cat
  end

end

