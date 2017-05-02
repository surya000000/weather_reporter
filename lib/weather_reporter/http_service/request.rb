require 'pry'
require 'httparty'
module WeatherReporter
  module HTTPService
    class Request
      attr_reader :data, :configuration

      KEY = 'key=', CITY = '&q='

      private_constant :KEY, :CITY

      def initialize(data, config_object)
        @configuration = config_object.read_file["APIXU"]
        @data = data
      end

      def report
        HTTParty.get(url)
      end

      private

      def api_url
        @data[:day] ? generate_forecast_url : generate_current_url
      end

      def generate_forecast_url
        "#{base_url}#{request_type["forcast"]}?#{KEY}#{api_key}#{CITY}#{@data[:city]}&day=#{@data[:day]}"
      end

      def generate_current_url
        "#{base_url}#{request_type['current']}?#{KEY}#{api_key}#{CITY}#{@data[:city]}"
      end

      def request_type
        @configuration["REQUEST_TYPE"]
      end

      def base_url
        @configuration["BASE_URL"]
      end

      def api_key
        @configuration["API_KEY"]
      end
    end
  end
end
