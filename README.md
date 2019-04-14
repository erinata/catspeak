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


## Licence

MIT licence

Copyright (C) 2012-2019 by Chungsang Tom Lam

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the “Software”), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED “AS IS”, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.