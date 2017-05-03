require 'ostruct'
require 'json'
module WeatherReporter
  module HTTPService
    class Response
      attr_reader :data

      def initialize(raw_data)
        @data = raw_data
      end

      def data
        JSON.parse(@data.to_json, object_class: OpenStruct)
      end
    end
  end
end
