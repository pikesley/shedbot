module Shedbot
  describe Relay do
    subject (:relay) { described_class.new 'spotlight' }

    it 'has a name' do
      expect(relay.name).to eq 'spotlight'
    end

    it 'has a pin number' do
      expect(relay.pin_number).to eq 13
    end

    it 'switches off a light' do
      expect(relay.pin).to receive(:on)
      relay.off
    end
  end
end
