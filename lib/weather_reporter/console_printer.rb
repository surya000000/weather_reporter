module WeatherReporter
  class ConsolePrinter

    ERROR_MESSAGE = 'Sorry weather report cannot generated'

    def initialize(weather_obj)
      @weather_obj = weather_obj
    end

    def print_to_console
      return error if error
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
  end
end
