module Shedbot
  describe Relays do
    subject (:relays) { described_class.new }

    it 'has relays' do
      expect(relays['inside']).to be_a Relay
    end

    it 'turns off a relay' do
      expect(subject['outside'].pin).to receive :on
      subject['outside'].off
    end
  end
end
