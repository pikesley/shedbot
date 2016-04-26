require 'sinatra/base'
require 'tilt/erubis'
require 'json'
require 'yaml'
require 'pi_piper'

require_relative 'shedbot/racks'
require_relative 'shedbot/helpers'
require_relative 'shedbot/config'
require_relative 'shedbot/relay'
require_relative 'shedbot/relays'

module Shedbot
  class App < Sinatra::Base
    helpers do
      include Shedbot::Helpers
    end

    RELAYS = Relays.new

    get '/' do
      respond_to do |wants|
        wants.html do
          redirect to '/lights'
        end
      end
    end

    get '/lights' do
      headers 'Vary' => 'Accept'

      respond_to do |wants|
        wants.html do
          @title = 'Shedbot'
          erb :lights, layout: :default
        end
      end
    end

    post '/lights/:which' do
    #patch '/lights/:which' do
      RELAYS[params[:which]].send(params[:state].to_sym)
      redirect to '/'
    end

    # start the server if ruby file executed directly
    run! if app_file == $0
  end
end
