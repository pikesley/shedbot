[slide 0 - spider]

This is a talk about gardens, renewable energy and massively-overengineering things

About two and a half years ago, I bought a house, with a garden. I'd never had a garden of my own before, but it turns out gardening is amazingly good fun. It's a south-facing garden: this will be important later on

[slide 1 - garden]

Here's a picture of my garden from June this year

Now it turns out that gardening requires a lot of equipment, and unless you want to really annoy your girlfriend by filling your kitchen with shovels and things, you're going to need a shed

[slide 2 - shed]

This is my shed. We put this up in the spring of 2014 and it contains a lawnmower and a chainsaw and all the usual sort of shed stuff. However the observant viewer may notice something on the roof

[slide 3 - panel]

Yes, I mounted a solar panel up there. This particular panel has some history with EMF Camp: at the first EMF in 2012, my friends Chris and Steve brought this panel along and used it to [get Chris to fill this in]. Since then it's been languishing at Steve's old flat, so when he offered it to sell it, the voltage regulator and a great big mobile-home battery for a very reasonable price, I snapped it up. And so the first lesson is

[reveal fragment] Have a friend who wants to offload a solar panel

The panel did not come with any fixings, just a bunch of holes in the underside of the frame. So as you can see, I lashed something together with a few metal straps, some cut-up plastic pipe and some roofing bolts

[slide 4 - regulator]

So inside the shed, I connected the voltage regulator to the battery (which I don't have a picture of because it's down behind my potting bench) and then to the panel, and as it was a sunny day everything lit up straight away and I had started gathering Free Energy

[slide 5 - power point]

Steve had also thrown in a couple of these power outlets with the panel, which have a 5-volt USB socket on them. So the first thing I plugged in was

[slide 6 - radio]

the radio. So far, this might seem like a tremendous feat of over-engineering just so I can listen to the cricket while I'm gardening. However, stay tuned, there's a lot more to come.

So, what to do with all this Free Energy, apart from my solar-powered Geoffrey Boycott? Well, I thought it might be nice to run some lights down there

[slide 7 - light]

So I got hold of some cheapo 12-volt lights off eBay, and hooked them up to the power outlets, and there was light

I've still got some spare 5-volt USB connections, though. What else do we know of that runs off of 5-volts USB? Yes, of course, a Raspberry Pi

[slide 8 - pi]

This is a Pi 3, with the built-in wifi. So I got Raspbian on there, got it on the network, and then I was able to get a shell on my shed, which was quite exciting. The next step was to see if I could switch the lights with the Pi

[slide 9 - relay]

So I bought this 12-volt relay and then I found out that it requires a 5-volt signal to switch it - the Pi's pins will only give 3.3 volts. And so we come to lesson 2:

[reveal fragment] Sometimes you need more grunt

Anyway, this gave me an excuse to play around with 

[slide 10 - arduino]

I've never done any Arduino stuff before and I've gotta be honest, I was a little bit intimidated. However it turns out that's it surprisingly easy, at least for this very simple case

[reveal fragment]

