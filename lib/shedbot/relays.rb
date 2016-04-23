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
        @relays[k].off
      end
    end

    def relays index
      @relays[index.to_s]
    end

    def on index
      relays(index).on
    end

    def off index
      relays(index).off
    end
  end
end
