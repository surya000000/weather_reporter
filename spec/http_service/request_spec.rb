require 'spec_helper'

module WeatherReporter
  module HTTPService
    RSpec.describe Request do
      it 'send request to the api' do
        get 'http://api.apixu.com/v1/current.json?key=5f7c4e53a0d645d382a14830173004&q=Kathmandu'
        expect(response).to be_success
      end
    end
  end
end
