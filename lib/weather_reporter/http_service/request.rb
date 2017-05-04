require 'httparty'
module WeatherReporter
  module HTTPService
    class Request
      attr_reader :data, :configuration

      CITY = '&q='.freeze

      private_constant :CITY

      def initialize(data, config_object)
        @configuration = config_object.read_file['APIXU']
        @data = data
      end

      def get_response
        HTTParty.get(api_url)
      end

      private

      def api_url
        @data[:forecast] ? generate_forecast_url : generate_current_url
      end

      def generate_forecast_url
        "#{base_url}#{request_type["forcast"]}?key=#{api_key}#{CITY}#{@data[:city]}"
      end

      def generate_current_url
        "#{base_url}#{request_type['current']}?key=#{api_key}#{CITY}#{@data[:city]}"
      end

      def request_type
        @configuration['REQUEST_TYPE']
      end

      def base_url
        @configuration['BASE_URL']
      end

      def api_key
        @configuration['API_KEY']
      end
    end
  end
end
