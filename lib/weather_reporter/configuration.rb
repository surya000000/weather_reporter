require 'yaml'
require 'pry'

module WeatherReporter
  class Configuration
    CONFIG_FILE_PATH = 'lib/weather_reporter/config/config.yml'

    def initialize(file = CONFIG_FILE_PATH)
      @file_path = file[:path]
    end

    def valid_mime_type
      file_mime_type = @file_path.split('.').last.downcase == 'yml'
      unless file_mime_type
        raise  WeatherReporter::Error::InvalidFile, 'Invalid file format'
      else
        file_mime_type
      end
    end

    def valid_file_path
      file
    rescue WeatherReporter::Error::InvalidPath
      raise WeatherReporter::Error::InvalidPath, 'config.yml not found'
    end

    def valid_yaml_syntax
      unless file.instance_of?(Hash)
        raise WeatherReporter::Error::InvalidFile, 'Invalid file format'
      else
        true
      end
    end

    def file
      YAML.load_file(@file_path)
    end

    def valid
      valid_mime_type && valid_file_path && valid_yaml_syntax
    end

    def read_file
      file if valid
    end
  end
end
