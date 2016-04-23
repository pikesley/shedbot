module Shedbot
  describe Relays do
    context 'open a relay' do
      before(:each) do
        expect(PiPiper::Pin).to receive(:new).with(pin: 6, direction: :out) do
          double = instance_double(PiPiper::Pin)
          expect(double).to receive(:off)
          expect(double).to receive(:on)
          double
        end

        expect(PiPiper::Pin).to receive(:new).with(pin: 13, direction: :out) do
          other_double = instance_double(PiPiper::Pin)
          expect(other_double).to receive(:off)
          other_double
        end
      end

      it 'opens relay 1' do
        described_class.new.open(1)
      end
    end

    context 'close a relay' do
      before(:each) do
        expect(PiPiper::Pin).to receive(:new).with(pin: 13, direction: :out) do
          double = instance_double(PiPiper::Pin)
          expect(double).to receive(:off).twice
          double
        end

        expect(PiPiper::Pin).to receive(:new).with(pin: 6, direction: :out) do
          other_double = instance_double(PiPiper::Pin)
          expect(other_double).to receive(:off)
          other_double
        end
      end

      it 'closes relay 2' do
        described_class.new.close(2)
      end
    end
  end
end
