module Shedbot
  module Helpers
    def get_state s
      begin
      s.split('=')[1].to_sym
    rescue NoMethodError
      require "pry" ; binding.pry
    end
    end
  end
end
