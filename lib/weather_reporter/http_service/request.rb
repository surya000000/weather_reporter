require 'pry'
require 'httparty'
module WeatherReporter
  module HTTPService
    class Request
      attr_reader :data, :configuration

      def initialize(data, config_object)
        @configuration = config_object.read_file["APIXU"]
        @data = data
      end

      def report
        response = HTTParty.get(api_url)
      end

      private

      def api_url
        @data[:day] ? generate_forecast_url : generate_currentl_url
      end

      def generate_forecast_url
        "#{base_url}#{request_type["forcast"]}?key=#{key}&q=#{data[:city]}day=#{data[:day]}"
      end

      def generate_currentl_url
        "#{base_url}#{request_type["current"]}?key=#{key}&q=#{data[:city]}"
      end

      def request_type
        @configuration["REQUEST_TYPE"]
      end

      def base_url
        @configuration["BASE_URL"]
      end

      def key
        @configuration["API_KEY"]
      end
    end
  end
end
