module Shedbot
  JSON_HEADERS = { 'HTTP_ACCEPT' => 'application/json' }

  describe App do
    it 'redirects to /lights' do
      get '/'
      expect(last_response.status).to equal 302
    end

    it 'turns off a light' do
      #  expect_any_instance_of(Relays).to receive(:off).with(1)
      #expect_any_instance_of(FakePin).to receive(:off)
      post '/lights/strip', {state: 'off'}, JSON_HEADERS
    end

    it 'turns on a light' do
      #expect_any_instance_of(Relays).to receive(:on).with(2)
      post '/lights/spot', {state: 'on'}, JSON_HEADERS
    end
  end
end
