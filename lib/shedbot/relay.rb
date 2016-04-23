module Shedbot
  class Relay
    def initialize pin_number
      @pin_number = pin_number
      @state = :off
    end

    def pin
      @pin ||= begin
        PiPiper::Pin.new(pin: @pin_number, direction: :out)
      rescue LoadError
        FakePin.new
      end
    end

    def open
      pin.on
      @state = :off
    end

    def close
      pin.off
      @state = :on
    end

    def state
      @state
    end
  end
end

class FakePin
  def method_missing m, *args
    puts "Received #{m.to_s} with #{args}"
  end
end
