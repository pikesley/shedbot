class TestHelper
  include Shedbot::Helpers
end

module Shedbot
  describe Helpers do
    let(:helpers) { TestHelper.new }

    it 'gets the state' do
      expect(helpers.get_state 'state=off').to eq :off
    end
  end
end
