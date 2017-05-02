require 'weather_reporter/version'
require 'weather_reporter/http_service/request'
require 'weather_reporter/configuration'
require 'weather_reporter/error/invalid_path'
require 'weather_reporter/error/invalid_flag'
require 'weather_reporter/error/invalid_file'
require 'weather_reporter/user_input/validator'
require 'weather_reporter/user_input/request_data'
require 'weather_reporter/http_service/request'
require 'weather_reporter/http_service/response'
require 'weather_reporter/output_formatter'

require 'pry'

module WeatherReporter

  def check_configuration
    WeatherReporter::Configuration.new
  end

  def user_input
    input = WeatherReporter::UserInput::Validator.new(take_user_input)
    input.input_arguments if input.validate
  end

  def get_valid_user_input
    WeatherReporter::UserInput::RequestData.new(user_input).generate
  end

  def call_to_api
    WeatherReporter::HTTPService::Request.new(get_valid_user_input, check_configuration).get_response
  end

  def get_api_response
    WeatherReporter::HTTPService::Response.new(call_to_api).data
  end

  def take_user_input
    ARGV
  end
end
