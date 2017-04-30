require 'spec_helper'

# Test cases for class WeatherReporter::Config
module WeatherReporter
  # Checks the return value of file_path method is a location of file
  RSpec.describe Configuration do
    describe '#file_path' do
      let(:config_class) { WeatherReporter::Configuration }

      it 'check presence of configuration file' do
        expect('~/weather_reporter/config/config.yml').to_eq(config_class::CONFIG_FILE_PATH)
      end

      describe '#is_valid?' do
        it 'raise exception for invalid file' do
          expect(config_class.new(path: 'invalid_').valid_file).to_raise(config_class::InvalidFile)
        end

        it 'checks checks for valid file' do
          expect(config_class.new(path: '~/weather_reporter/config/config.yml').valid_file).to_eq(true)
        end
      end

      describe '#read_file' do
        it 'gets file object as hash' do
          config_class.new(config_class.read_file)
        end
      end
    end
  end
end
