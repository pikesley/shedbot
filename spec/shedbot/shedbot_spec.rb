module Shedbot
  JSON_HEADERS = { 'HTTP_ACCEPT' => 'application/json' }

  describe App do
    it 'redirects to /lights' do
      get '/'
      expect(last_response.status).to equal 302
    end

    context 'return JSON' do
      it 'knows a light is off' do
        patch '/lights/spotlight', {state: 'off'}, JSON_HEADERS
        get '/lights/spotlight'
        expect(JSON.parse last_response.body).to eq ({
          'spotlight' => 'off'
        })
      end

      it 'knows a light is on' do
        patch '/lights/striplight', {state: 'on'}, JSON_HEADERS
        get '/lights/striplight'
        expect(JSON.parse last_response.body).to eq ({
          'striplight' => 'on'
        })
      end
    end

    it 'turns off a light' do
      expect_any_instance_of(Relay).to receive(:off)
      patch '/lights/striplight', {state: 'off'}, JSON_HEADERS
    end

    it 'turns on a light' do
      expect_any_instance_of(Relay).to receive(:on)
      patch '/lights/spotlight', {state: 'on'}, JSON_HEADERS
    end
  end
end
