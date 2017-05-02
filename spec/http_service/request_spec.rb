require 'spec_helper'
module WeatherReporter
  module HTTPService
    RSpec.describe Request do
      require 'pry'

      let(:data) { { city: 'kathmandu' } }
      let(:config) { WeatherReporter::Configuration.new }
      let(:request) do
        WeatherReporter::HTTPService::Request.new({ city: 'kathmandu' }, config)
      end

      describe '.initialize' do
        it 'set data of the object from user' do
          expect(request.data).to(eq(data))
        end

        it 'carries valid configuration' do
          expect(request.configuration).to(eq(config.read_file['APIXU']))
        end
      end

      describe '#get_data' do
        it 'gets reponce form the API call' do
          expect(request.get_response.class).to(eq(HTTParty::Response))
        end
      end

    end
  end
end
