require 'spec_helper'

# Test cases for class WeatherReporter::Config
module WeatherReporter
  # Checks the return value of file_path method is a location of file
  RSpec.describe Configuration do
    describe '#file_path' do
      let(:config_class) { WeatherReporter::Configuration }

      let(:file_path) { 'lib/weather_reporter/config/config.yml' }

      it 'check presence of configuration file' do
        expect(file_path).to(eq(config_class::CONFIG_FILE_PATH))
      end

      describe '#valid' do
        it 'raise exception for invalid file' do
          expect do
            raise config_class.new(path: 'invalid_').valid, 'Invalid file format'
          end.to(raise_error.with_message('Invalid file format'))
        end

        it 'checks checks for valid file' do
          expect(config_class.new(path: file_path).valid).to(eq(true))
        end
      end

      describe '#read_file' do
        it 'gets file object as hash' do
          expect(config_class.new(path: file_path).read_file).to(eq())
        end
      end
    end
  end
end
