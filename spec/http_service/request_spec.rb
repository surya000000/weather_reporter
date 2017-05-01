require 'spec_helper'
module WeatherReporter
  module HTTPService
    RSpec.describe Request do
      require 'pry'
      let(:data) {{city: "kathmandu"}}
      let(:config) {WeatherReporter::Configuration.new.read_file }
      let(:request) do
        WeatherReporter::HTTPService::Request.new({city: "kathmandu"}, config)
      end



      describe '.initialize' do
        it 'set data of the object from user' do
          expect(request.data).to eq(data)
        end
      end

      describe '#report' do
        it 'send data to the api' do
          expect(request.report).to eq(0)
        end
      end

    end
  end
end
