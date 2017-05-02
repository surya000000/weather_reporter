module WeatherReporter
  include OutputFormatter

  class ConsolePrinter

    ERROR_MESSAGE = 'Sorry weather report cannot generated'

    def initialize(weather_obj)
      @weather_obj = weather_obj
    end

    def print_to_console
        return error if error
       puts(condition_map[:"#{weather_condition}"])
    end

    def weather_condition
      @weather_obj.current.condition.text
    end

    def error
      error_code_present? ? error_message : empty_object
    end

    def error_code_present?
      @weather_obj.respond_to?(:error)
    end

    def empty_object
      ERROR_MESSAGE unless @weather_obj.location.current.respond_to?(:text)
    end

    def error_message
      error_message = @weather_obj.error.message.gsub('q', 'city')
      error_message ? error_message : @weather_obj.error.message
    end

    def condition_map
      {
        "Sunny": sunny,
        "Overcast": cloudy,
        "Mist": partly_cloudy,
        "Partly cloudy": partly_cloudy,
        "Light rain": light_rain,
        "Light rain shower": light_rain,
        'Patchy rain possible': light_rain
      }
    end
  end
end
