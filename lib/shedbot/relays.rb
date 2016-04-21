module Shedbot
  class Relays
    LOOKUPS = {
      '1' => '6',
      '2' => '13'
    }

    def initialize
      @relays = {}
    end

    def relays index
      @relays[index.to_s] ||= PiPiper::Pin.new(pin: LOOKUPS[index.to_s].to_i, direction: :out)
    end

    def open index
      relays(index).on
    end

    def close index
      relays(index).off
    end
  end
end
