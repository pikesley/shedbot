module Shedbot
  class Relay
    LOOKUPS = {
      '1' => '6',
      '2' => '13'
    }

    def self.open index
      pin = PiPiper::Pin.new(pin: LOOKUPS[index.to_s].to_i, direction: :out)
      pin.on
    end

    def self.close index
      pin = PiPiper::Pin.new(pin: LOOKUPS[index.to_s].to_i, direction: :out)
      pin.off
    end
  end
end
