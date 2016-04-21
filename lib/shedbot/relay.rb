module Shedbot
  class Relay
    LOOKUPS = {
      '1' => '6',
      '2' => '13'
    }

    RELAYS = [
      PiPiper::Pin.new(pin: LOOKUPS['1'].to_i, direction: :out),
      PiPiper::Pin.new(pin: LOOKUPS['2'].to_i, direction: :out),
    ]

    def self.open index
      RELAYS[index - 1].on
    end

    def self.close index
      RELAYS[index - 1].off
    end
  end
end
