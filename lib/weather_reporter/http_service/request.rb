require 'pry'
require 'httparty'
module WeatherReporter
  module HTTPService
    class Request
      attr_reader :data, :configuration
      def initialize(data, config_object)
        @configuration = config_object.read_file
        @data = data
      end

      def report
        HTTParty.get(url)
      end

      private

      def url
        base_url = @configuration["APIXU"]["BASE_URL"]
        key = @configuration["APIXU"]["API_KEY"]
        request_type = @configuration["APIXU"]["REQUEST_TYPE"]
        data = @data
        if data[:day]
          base_url + request_type["forcast"] + '?key='+ key + '&q=' + data[:city] + 'day=' + data[:day]
        else
          base_url + request_type["current"] + '?key='+ key + '&q=' + data[:city]
        end
      end

    end
  end
end
