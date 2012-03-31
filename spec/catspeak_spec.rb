require 'catspeak'

describe "Catspeak" do	
	include Catspeak

  it "should create cats" do    
    cat().should be_an_instance_of Catspeak::Cat
  end

  # TODO create custom animals by supplying characters and let the Gem from the char and tone dictionary

end

