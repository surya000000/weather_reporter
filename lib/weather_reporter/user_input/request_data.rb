module WeatherReporter
  module UserInput
    class RequestData
      def initialize(data)
        @data = data
      end

      def generate
        return get_help_text if @data.length.equal?(1) && @data[0][0] == '-help'
        return api_data
      end

      def get_help_text
        """\033[32m
        Enter -help to for help
        Enter -day days for weather forecast fot days eg: -day 10
        Enter -city cityname for getting todays forecast of your city\033[0m
        """
      end

      def api_data
        request_data = {}
        @data.each do |data|
          request_data[:city] = data[1] if data[0] == '-city'
          request_data[:forecast] = true if data[0] == '-forecast'
        end
        request_data
      end
    end
  end
end
