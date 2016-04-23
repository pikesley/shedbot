module Shedbot
  class Relays
    LOOKUPS = {
      '1' => 6,
      '2' => 13
    }

    def initialize
      @relays = {}
      LOOKUPS.each_pair do |k, v|
        @relays[k] = Relay.new v
        @relays[k].close
      end
    end

    def relays index
      @relays[index.to_s]# ||= PiPiper::Pin.new(pin: LOOKUPS[index.to_s].to_i, direction: :out)
    end

    def open index
      relays(index).open
    end

    def close index
      relays(index).close
    end
  end
end
