require 'ostruct'
require 'json'
module WeatherReporter
  module HTTPService
    class Response
      attr_reader :data

      def initialize(data)
        @data = data
      end

      def data
        JSON.parse(@data.to_json, object_class: OpenStruct)
      end
    end
  end
end
