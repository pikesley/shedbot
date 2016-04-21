module Shedbot
  JSON_HEADERS = { 'HTTP_ACCEPT' => 'application/json' }

  describe App do
    it 'says hello' do
      get '/'
      expect(last_response).to be_ok
      expect(last_response.body).to match /Hello from Shed-Pi!/
    end

    it 'serves JSON' do
      get '/', nil, JSON_HEADERS
      expect(last_response).to be_ok
      expect(JSON.parse last_response.body).to eq (
        {
          'app' => 'Shedbot'
        }
      )
    end

    it 'turns off a light' do
      expect_any_instance_of(Relays).to receive(:open).with(1)
      patch '/lights/strip', {state: 'off'}, JSON_HEADERS
    end

    it 'turns on a light' do
      expect_any_instance_of(Relays).to receive(:close).with(2)
      patch '/lights/spot', {state: 'on'}, JSON_HEADERS
    end
  end
end
