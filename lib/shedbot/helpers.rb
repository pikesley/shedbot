module Shedbot
  module Helpers
    def get_state s
      s.split('=')[1].to_sym
    end

    def logger
      request.logger
    end
  end
end
