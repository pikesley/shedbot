class TestHelper
  include Shedbot::Helpers
end

module Shedbot
  describe Helpers do
    let(:helpers) { TestHelper.new }
  end
end
