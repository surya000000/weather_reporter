require 'weather_reporter/version'
require 'weather_reporter/http_service/request'
require 'weather_reporter/configuration'
require 'weather_reporter/error/invalid_path'
require 'weather_reporter/error/invalid_flag'
require 'weather_reporter/error/invalid_file'
require 'weather_reporter/user_input/validator'
require 'weather_reporter/user_input/request_data'
require 'pry'

module WeatherReporter

  def check_configuration
    WeatherReporter::Configuration.new.read_file
  end

  def user_input
    input = WeatherReporter::UserInput::Validator.new(take_user_input)
    input.input_arguments if input.validate
  end

  def get_valid_user_input
    WeatherReporter::UserInput::RequestData.new(user_input).generate
  end

  def take_user_input
    ARGV
  end
end
