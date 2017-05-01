require 'weather_reporter/version'
require 'weather_reporter/http_service/request'
require 'weather_reporter/configuration'
require 'weather_reporter/error/invalid_path'
require 'weather_reporter/error/invalid_flag'
require 'weather_reporter/error/invalid_file'
require 'weather_reporter/user_input/validator'

require 'pry'
module WeatherReporter
  def take_user_input
    ARGV.each_slice(2).to_a
  end
end
