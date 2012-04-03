# Catspeak

This is a gem for translating human language to cat language.

## Installation

    gem install catspeak

## Usage

To use catspeak, you have to require the gem

    require 'catspeak'

To create a new cat,

    tom = Catspeak::Cat.new("Tom")

To translate human language to cat language,

    puts tom.speak("Hello!")

You will get

    "meaO?-?- Me--Mw--mIU\\(-.-)/ "

To translate cat language back to human language,

    puts tom.listen("meaO?-?- Me--Mw--mIU\\(-.-)/ ")

You will get

    "Hello!"


## License

Currently not released under any license