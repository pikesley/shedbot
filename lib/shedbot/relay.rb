module Shedbot
  class Relay
    def initialize light
      @config = Config.new
      @light = light
      off
    end

    def pin_number
      @pin_number ||= @config.relays[@light]['pin']
    end

    def name
      @light
    end

    def pin
      @pin ||= begin
        if @config.actual_pi
          PiPiper::Pin.new pin: pin_number, direction: :out
        else
          FakePin.new pin: pin_number, direction: :out
        end
      end
    end

    def on
      pin.off
      @state = :on
    end

    def off
      pin.on
      @state = :off
    end

    def state
      @state
    end
  end
end

class FakePin
  def initialize pin:, direction:
    @pin = pin
  end

  def off
    "#{self.class} #{@pin} turned off"
  end

  def on
    "#{self.class} #{@pin} turned on"
  end
end
