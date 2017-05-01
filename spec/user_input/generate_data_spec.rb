require 'spec_helper'
require 'pry'
module WeatherReporter
  module UserInput
    RSpec.describe RequestData do
      describe '#generate' do
        it 'returns the hash data' do
          expect(
            RequestData.new(WeatherReporter::UserInput::Validator.new(%w{-city kathmandu -day 10})
                     .input_arguments).generate
          ).to(eq({ city: 'kathmandu', day: '10' }))
        end
      end
    end
  end
end
