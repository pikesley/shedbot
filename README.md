[![Build Status](http://img.shields.io/travis/pikesley/shedbot.svg?style=flat-square)](https://travis-ci.org/pikesley/shedbot)
[![Dependency Status](http://img.shields.io/gemnasium/pikesley/shedbot.svg?style=flat-square)](https://gemnasium.com/pikesley/shedbot)
[![Coverage Status](http://img.shields.io/coveralls/pikesley/shedbot.svg?style=flat-square)](https://coveralls.io/r/pikesley/shedbot)
[![Code Climate](http://img.shields.io/codeclimate/github/pikesley/shedbot.svg?style=flat-square)](https://codeclimate.com/github/pikesley/shedbot)
[![License](http://img.shields.io/:license-mit-blue.svg?style=flat-square)](http://pikesley.mit-license.org)

# Shedbot

RESTful API for the Internet of Sheds. You'll also want the [Arduino stuff](https://github.com/pikesley/relay-puller)

![Screenshot](https://i.imgur.com/UF0jOr5.png)

# Running it

    git clone https://github.com/pikesley/shedbot/
    cd shedbot
    bundle
    bundle exec puma

Then go to [localhost:9292](http://localhost:9292)

## Configuration

There is a _config/config.yml_ file (which should be overriden at _~/.shedbot/config.yml_) which looks like

    relays:
      spotlight:
        pin: 13
      striplight:
        pin: 6

This associates a light with a (logical) pin

### Auto Pi Detection

If `RUBY_PLATFORM` matches `/arm.*-linux/` then the assumption is made that this is running on a real Raspberry Pi, where [PiPiper](https://github.com/jwhitehorn/pi_piper) will work properly - if some other OS is identified then [fake pins](https://github.com/pikesley/shedbot/blob/96b6add4c5bf6dab20293243d32b64fdfab8337f/lib/shedbot/relay.rb#L43-L55) are used for testing

# API

This is so, so Alpha, but:

## Switching lights

    PATCH /lights/:light

with a JSON payload like

    {
      state: on
    }

will (attempt to) set the light identified by _:light_ to _on_. This is the method called by the controls in the HTML front-page

## Reading state

    GET /lights/:light

will return a JSON object describing the state of _:light_, thus:

    {
      spotlight: "on"
    }

# Next steps

Because this is interacting with the Real World of Physical Things, we should not assume that setting `state=on` _actually causes anything to happen_. This all needs to happen asynchronously (via a _Sheduler_, thanks [@floppy](https://github.com/floppy)) and then the actual status can be reported back on a different endpoint

And it's important that this is all implemented correctly or the whole thing is rendered ludicrous

# I gave a talk about this

I have spoken about this nonsense in public: at [EMF Camp 2016](http://sam.pikesley.org/projects/shedbot/video), and at an [ODI Friday Lecture](https://www.youtube.com/watch?v=g6vUe-ACaZ8&feature=youtu.be&t=13m4s). The latest iteration of the slides is [here](http://sam.pikesley.org/projects/shedbot/presentation)

![Computers](https://i.imgur.com/HxKmjss.jpg)
