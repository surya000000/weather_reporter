require 'spec_helper'
module WeatherReporter
  module HTTPService
    RSpec.describe Request do
      describe '#data' do
        it 'gives hash as a object' do
          response = WeatherReporter::HTTPService::Response.new({ location: { name: 'kathmandu' }}).data
          expect(response.location.name).to(eq('kathmandu'))
        end
      end
    end
  end
end
