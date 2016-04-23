require 'sinatra/base'
require 'tilt/erubis'
require 'json'
require 'pi_piper'

require_relative 'shedbot/racks'
require_relative 'shedbot/helpers'
require_relative 'shedbot/relays'
require_relative 'shedbot/relay'

module Shedbot
  class App < Sinatra::Base
    helpers do
      include Shedbot::Helpers
    end

    RELAYS = Relays.new

    LOOKUPS = {
      'strip' => 1,
      'spot' => 2
    }

    get '/' do
      respond_to do |wants|
        wants.html do
          redirect to '/lights'
        end

        wants.json do
          {
            app: 'Shedbot'
          }.to_json
        end
      end
    end

    get '/lights' do
      headers 'Vary' => 'Accept'

      respond_to do |wants|
        wants.html do
          @content = '<h1>Hello from Shed-Pi!</h1>'
          @title = 'Shedbot'
          erb :lights, layout: :default
        end
      end
    end

    post '/lights/:which' do
    #patch '/lights/:which' do
      if params['state'] == 'on'
        method = :on
      end

      if params['state'] == 'off'
        method = :off
      end

      begin
        RELAYS.send(params['state'].to_sym, LOOKUPS[params['which']])
      rescue LoadError
        puts "Sending '#{params['state']}' to Relay #{LOOKUPS[params['which']]}"
      end

      redirect to '/'
    end

    # start the server if ruby file executed directly
    run! if app_file == $0
  end
end
