module Shedbot
  class Relays < Hash
    def initialize
      @config = Config.new
      @config.relays.keys.each do |r|
        self[r] = Relay.new(r)
      end
    end
  end
end
