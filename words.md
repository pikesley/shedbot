>slide - spider

Hello, my name is Sam, and this is a story about gardens, renewable energy and massively-overengineering things

About two and a half years ago, I bought a house, with a garden. I'd never had a garden of my own before, but it turns out gardening is amazingly good fun, and in fact if you've spoken to me for more than about five minutes in the last two years, I've almost certainly bored you to death about my beautiful south-facing garden. The question of which way it faces will be important later on

>slide - garden

Here's a picture of my garden from June this year

Now it turns out that gardening requires a lot of equipment, and unless you want to really annoy your girlfriend by filling your kitchen with shovels and things, you're going to need a shed

>slide - shed

This is my shed. We put this up in the spring of 2014 and it contains a lawnmower and a chainsaw and all the usual sort of shed stuff. However the observant viewer may notice something on the roof

>slide - panel

Yes, I mounted a solar panel up there. This particular panel has some history with EMF Camp: at the first EMF in 2012, my friends Chris and Steve brought this panel along and used it to [get Chris to fill this in]. Since then it's been languishing at Steve's old flat, so when he offered it to sell it, the voltage regulator and a great big mobile-home battery for a very reasonable price, I snapped it up. And so the first lesson is

>slide - Have a friend who wants to get shot of a solar panel

The panel did not come with any fixings, just a bunch of holes in the underside of the frame. So as you can see, I lashed something together with a few metal straps, some cut-up plastic pipe and some roofing bolts, and I sealed all the holes with silicone sealant and Sugru

>slide - regulator

So inside the shed, I connected the voltage regulator to the battery (which I don't have a picture of because it's down behind my potting bench) and then to the panel, and as it was a sunny day everything lit up straight away and I had started gathering Free Energy

>slide - power point

Steve had also thrown in a couple of these power outlets with the panel, which have a 5-volt USB socket on them. So the first thing I plugged in was

>slide - radio

the radio. If this seems like a tremendous feat of over-engineering just so I can listen to the cricket while I'm gardening, strap yourselves in because w're just getting started

So, what to do with all this Free Energy, apart from my solar-powered Geoffrey Boycott? Well, I thought it might be nice to run some lights down there

>slide - light

So I got hold of some cheapo 12-volt lights off eBay, and hooked them up to the power outlets, and there was light

But of course I've still got some spare 5-volt USB connections. What else do we know of that runs off of 5-volts USB? Yes, of course, a Raspberry Pi

>slide - pi

This is a Pi 3, with the built-in wifi. So I got Raspbian on there, got it on the network, and then I was able to get a shell on my shed, which was quite exciting. The next step was to see if I could switch the lights with the Pi

>slide - relay

So I bought this 12-volt relay and connected the lights (by cutting the positive wire and connecting that across the switch) and then I found out that it requires a 5-volt signal to switch it - the Pi's pins will only give 3.3 volts. And so we come to the next lesson:

>slide - Sometimes you need more grunt

Anyway, this gave me an excuse to play around with

>slide - arduino

I've never done any Arduino stuff before and I've gotta be honest, I was a little bit intimidated. However it turns out that's it surprisingly easy, at least for this very simple case

>slide - Code

This code is dead, dead simple: we define four input pins and four output pins, then inside the loop we simply map the state of each input pin to the corresponding output pin. So when Input Pin 1 goes high, Output Pin 1 goes high, which throws Relay Switch 1, which makes a very satisfying 'clunk' noise and switches a light on. So the next lesson is

>slide - arduino

So what about the Raspberry Pi end of this?

>slide - pi

There is a Ruby Gem called `pi_piper` for controlling the IO pins, and aside from requiring root privileges it's very easy to use. However

>slide - The Raspberry Pi pin layout is an unspeakable shambles

The physical pin numbers bear not the slightest relation to the logical pin numbers. There are presumably good reasons for this, but without the Treasure Map provided by

>reveal fragment - pinout.xyz

the fine people at pinout.xyz, I'd have been at a loss

>slide - API

So, what about an API? I broke out my favourite Ruby web framework, Sinatra, and put together a very simple API. The main endpoint is

>slide - API

But then I came up against the issue of which HTTP method to use. My first thought was do something like

>slide - API

a GET, but after extensive discussions with my colleague James and my boss Jeni _who used to sit on the WWW Technical Architecture Group_, this was rejected, as was my second idea of POSTing some JSON. So the next lesson is

>slide - ask some experts

or, depending on your perspective,

>reveal fragment - waste people's time

because it turns out the correct, RESTful solution for something like this is

>slide - patch

and if we're not going to do this correctly then the whole thing is rendered preposterous. PATCH is a thing that's used under the hood in Rails, but I'd never implemented it before, and I'm not sure anybody else uses it much either: where the common verbs like GET and POST are natively supported in jQuery, for PATCH I had to construct my own Ajax call for my front-end application

>slide - code

This is still not _entirely_ correct - because this is interacting with Real Things in the Real World, I think this should all be done asynchronously, via a _sheduler_, and then there should be another endpoint which reports the actual state of the light. In practice, however, this works just fine as it is

So what does this all look like in practice? Well, if you're on my home network and you point your web browser at the Pi, there's a screen like this

>slide - screenshot

And you can click those switches and turn the lights on and off, which is awesome. HOWEVER there is a massive flaw in all of this: if I don't have my phone with me, then short of pulling wires out I HAVE NO WAY OF CONTROLLING THE LIGHTS. So possibly the most important lesson is

>slide - Install some actual physical switches

So what else might I do with all this?

>slide - complete

Well, I have a few ideas:

>reveal - sunset / sunrise API

I discovered an API which takes a lat / lang and tells you the exact times of sunset and sunrise at that location. I thought I might use this to have the lights come on as the sun goes down. It was pointed out to me that you can buy solar lights from Ikea that turn on when it gets dark without recourse to anything so complicated, but where's the fun in that?

>reveal - implement the sheduler

As mentioned previously, I should really make this happen asynchronously, but that's unlikely ever to actually transpire

>reveal - charge batteries

Thinking more widely about what to do with all this free energy, I'm pretty sure I should be able to recharge the batteries for my cordless drill but I don't really know where to begin with that

>slide - questions?
