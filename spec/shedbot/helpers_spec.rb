class TestHelper
  include Shedbot::Helpers
end

module Shedbot
  describe Helpers do
    let(:helpers) { TestHelper.new }

    it 'says hello' do
      expect(helpers.hello).to eq 'Hello'
    end
  end
end
