require 'spec_helper'

# Test cases for class WeatherReporter::Config
module WeatherReporter
  module Config
    # Checks the return value of file_path method is a location of file
    Rspec.describe '#' do
      describe '#file_path' do
        let(:config_class) { WeatherReporter::Config }

        it 'check presence of config file' do
          expect(config_class.new(file_path: config_class.file_path).to_eq(config_class))
        end

        it 'raise exception for invalid file' do
          expect(config_class.new(path: 'invalid_')).to_raise_error(WeatherReporter::InvalidFile)
        end

        describe '#read_file' do
          it 'gets file object as hash' do
            config_class.new(config_class.file_path)
          end
        end
      end
    end
  end
end
