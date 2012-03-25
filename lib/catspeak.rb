require "catspeak/version"
require "catspeak/cat"

module Catspeak
	def cat(name = '')
  	Cat.new(name)
  end
end

