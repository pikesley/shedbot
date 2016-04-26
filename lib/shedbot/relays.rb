module Shedbot
  class Relays
    def initialize
      @config = Config.new
      @relays = {}
      @config.relays.keys.each do |r|
        @relays[r] = Relay.new r
      end
    end

    def [] key
      @relays[key]
    end
  end
end
