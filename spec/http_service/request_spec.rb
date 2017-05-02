require 'spec_helper'
module WeatherReporter
  module HTTPService
    RSpec.describe Request do

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

        it 'get data of the given city' do
          json = JSON.parse(File.read("spec/fixtures/weather.json"))
          responce =  JSON.parse(request.get_response)
          expect(responce['location']['name']).to eq(json['location']['name'])
        end
      end

    end
  end
end
