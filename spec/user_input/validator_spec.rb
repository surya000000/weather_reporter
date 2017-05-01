module WeatherReporter
  module UserInput
    RSpec.describe Validator do
      let(:validator_class) { WeatherReporter::UserInput::Validator }

      describe '#input_arguments' do
        it 'gets pair of array with flag and argument' do
          flag_argument = validator_class.new(%w{-city kathmandu -day 10}).input_arguments
          expect(flag_argument).to(eq([['-city', 'kathmandu'], ['-day', '10']]))
        end
      end

      describe '#validate_input' do
        it 'throws exception for invalid input' do
          input = validator_class.new(%w{-c kathmandu -d 10})
          expect do
            raise input.validate
          end.to(raise_error.with_message('Please enter a valid flag or Enter -help for more details'))
        end
      end

      describe '#get_data' do
        it 'returns valid data' do
          expect(validator_class.new(%w{-city kathmandu -day 10}).input_arguments)
                .to(eq([['-city', 'kathmandu'], ['-day', '10']]))
        end
      end
    end
  end
end
