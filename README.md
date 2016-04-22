[![Build Status](http://img.shields.io/travis/pikesley/shedbot.svg?style=flat-square)](https://travis-ci.org/pikesley/shedbot)
[![Dependency Status](http://img.shields.io/gemnasium/pikesley/shedbot.svg?style=flat-square)](https://gemnasium.com/pikesley/shedbot)
[![Coverage Status](http://img.shields.io/coveralls/pikesley/shedbot.svg?style=flat-square)](https://coveralls.io/r/pikesley/shedbot)
[![Code Climate](http://img.shields.io/codeclimate/github/pikesley/shedbot.svg?style=flat-square)](https://codeclimate.com/github/pikesley/shedbot)
[![License](http://img.shields.io/:license-mit-blue.svg?style=flat-square)](http://pikesley.mit-license.org)

# Shedbot

RESTful API for the Internet of Sheds. You'll also want the [Arduino stuff](https://github.com/pikesley/relay-puller)

## cURL it

Try something like

    curl -X PATCH --data state=on http://192.168.1.125:9292/lights/strip

    curl -X PATCH --data state=off http://192.168.1.125:9292/lights/spot

and hear those relays click (I've not actually connected them to any real lights yet)

## Next

Because this is interacting with the Real World of Physical Things, we cannot assume that setting `state=on` _actually causes anything to happen_. This all needs to happen asynchronously (via a _Sheduler_, thanks [@floppy](https://github.com/floppy)) and then the actual status can be reported back on a different endpoint

And it's important that this is all implemented correctly or the whole thing is rendered ludicrous

![Computers](http://i.imgur.com/HxKmjss.jpg)
