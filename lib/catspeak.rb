require "catspeak/version"
require "catspeak/cat"

module Catspeak
  def self.cat(name)
  	Cat.new(name)
  end


end
