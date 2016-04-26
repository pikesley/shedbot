module Shedbot
  describe Relays do
    subject (:relays) { described_class.new }

    it 'has relays' do
      expect(relays['spotlight']).to be_a Relay
    end

    it 'turns off a relay' do
      expect(subject['striplight'].pin).to receive :on
      subject['striplight'].off
    end
  end
end
