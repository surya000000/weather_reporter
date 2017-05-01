module WeatherReporter
  module UserInput
    RSpec.describe Validator do
      let(:validator_class) { WeatherReporter::UserInput::Validator }

      describe '#pair_flag_argument' do
        it 'gets pair of array with flag and argument' do
          flag_argument = validator_class.new(%w{-city kathmandu -day 10}).pair_flag_argument
          expect(flag_argument).to(eq([['-city', 'kathmandu'], ['-day', '10']]))
        end
      end

      describe '#validate_input' do
        it 'throws exception for invalid input' do
          validate_input = validator_class.new(%w{-c kathmandu -d 10})
          expect do
            raise validate_input.validate_input
          end.to(raise_error.with_message('Please enter a valid flag'))
        end
      end
    end
  end
end
