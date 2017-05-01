require 'pry'
require 'httparty'
module WeatherReporter
  module HTTPService
    class Request
      attr_reader :data
      def initialize(data, config_object)
        @configuration = config_object.read_file
        @data = data
      end
      def report
        responce = HTTParty.get("http://api.apixu.com/v1/current.json?key=5f7c4e53a0d645d382a14830173004&q=Kathmandu")
        binding.pry
      end
    end
  end
end
