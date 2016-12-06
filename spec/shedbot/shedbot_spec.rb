module Shedbot
  JSON_HEADERS = { 'HTTP_ACCEPT' => 'application/json' }

  describe App do
    it 'redirects to /lights' do
      get '/'
      expect(last_response.status).to equal 302
    end

    context 'return JSON' do
      it 'knows a light is off' do
        patch '/lights/inside', {state: 'off'}, JSON_HEADERS
        get '/lights/inside'
        expect(JSON.parse last_response.body).to eq ({
          'inside' => 'off'
        })
      end

      it 'knows a light is on' do
        patch '/lights/outside', {state: 'on'}, JSON_HEADERS
        get '/lights/outside'
        expect(JSON.parse last_response.body).to eq ({
          'outside' => 'on'
        })
      end
    end

    it 'turns off a light' do
      expect_any_instance_of(Relay).to receive(:off)
      patch '/lights/outside', {state: 'off'}, JSON_HEADERS
    end

    it 'turns on a light' do
      expect_any_instance_of(Relay).to receive(:on)
      patch '/lights/inside', {state: 'on'}, JSON_HEADERS
    end
  end
end
