module Shedbot
  describe Relay do
    context 'open a relay' do
      before(:each) do
        expect(PiPiper::Pin).to receive(:new).with(pin: 6, direction: :out) do
          double = instance_double(PiPiper::Pin)
          expect(double).to receive(:on)
          double
        end
      end

      it 'opens relay 1' do
        described_class.open(1)
      end
    end

    context 'close a relay' do
      before(:each) do
        expect(PiPiper::Pin).to receive(:new).with(pin: 13, direction: :out) do
          double = instance_double(PiPiper::Pin)
          expect(double).to receive(:off)
          double
        end
      end

      it 'closes relay 2' do
        described_class.close(2)
      end
    end
  end
end
