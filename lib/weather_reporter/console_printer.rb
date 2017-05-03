module WeatherReporter
  include OutputFormatter

  class ConsolePrinter

    ERROR_MESSAGE = 'Sorry weather report cannot generated'

    def initialize(weather_obj)
      @weather_obj = weather_obj
    end

    def print_to_console
      return error if error
      puts output
      forecast if @weather_obj.forecast
    end

    def current_output
      symbols = condition_map[:"#{weather_condition}"]
      "\e[1m\n#{symbols}\n
         #{@weather_obj.location.name}  |  #{@weather_obj.location.country}\n
         #{@weather_obj.location.localtime}\n
         Humidity: #{@weather_obj.current.humidity}% | #{weather_condition}\n
         Temperature: #{@weather_obj.current.temp_c} Celcius | #{@weather_obj.current.temp_f } Fahrenheit
      \e[0m
      "
    end

    def forecast_output
      forecast_data = @weather_obj.forecast.forecastday
      forecast_summary = forecast_data.first.day #max,min temp of day
      hourly_reports = forecast_data.first.hour
      hourly_reports.values_at(7,15,23).each do |report|
        puts print_report(report)
      end
    end

    def print_report(report)
      symbols = condition_map[:"#{report.condition.text}"]
      "\e[1m\n#{symbols}\n
         Time: #{report.time}
         Humidity: #{report.humidity}% | #{report.condition.text}\n
         Temperature: #{report.temp_c} Celcius | #{report.temp_f } Fahrenheit
      \e[0m
      "
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
      ERROR_MESSAGE unless @weather_obj.current.respond_to?(:condition)
    end

    def error_message
      error_message = @weather_obj.error.message.gsub('q', 'city')
      error_message ? error_message : @weather_obj.error.message
    end

    def condition_map
      {
        "Sunny": sunny,
        "Cloudy": cloudy,
        "Overcast": cloudy,
        "Mist": mist,
        "Partly cloudy": partly_cloudy,
        "Light rain": light_rain,
        "Light rain shower": light_rain,
        'Patchy rain possible': light_rain,
        'Light snow': light_snow,
        'Clear': clear,
        'Moderate or heavy snow showers': snow,
        'Fog': fog
      }
    end
  end
end
