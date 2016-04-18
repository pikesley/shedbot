require 'sinatra/base'
require 'tilt/erubis'
require 'json'

require_relative 'shedbot/racks'
require_relative 'shedbot/helpers'

module Shedbot
  class App < Sinatra::Base
    helpers do
      include Shedbot::Helpers
    end

    get '/' do
      headers 'Vary' => 'Accept'

      respond_to do |wants|
        wants.html do
          @content = '<h1>Hello from Shed-Pi!</h1>'
          @title = 'Shedbot'
          erb :index, layout: :default
        end

        wants.json do
          {
            app: 'Shedbot'
          }.to_json
        end
      end
    end

    # start the server if ruby file executed directly
    run! if app_file == $0
  end
end
