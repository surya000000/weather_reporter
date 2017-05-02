require 'spec_helper'
module WeatherReporter
  module UserInput
    RSpec.describe RequestData do
      describe '#generate' do
        it 'returns the hash data' do
          expect(
            RequestData.new(WeatherReporter::UserInput::Validator.new(%w{-city kathmandu -forecast})
                     .input_arguments).generate
          ).to(eq({ city: 'kathmandu', forecast: true }))
        end
      end
    end
  end
end
