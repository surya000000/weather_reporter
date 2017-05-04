module WeatherReporter
  include OutputFormatter

  class ConsolePrinter

    ERROR_MESSAGE = 'Sorry weather report cannot generated'.freeze

    WEATHER_TEXT =  {
                     'Sunny': :sunny, 'Cloudy': :cloudy, 'Overcast': :cloudy, 'Mist': :mist,
                     'Partly cloudy': :partly_cloudy, 'Light rain': :light_rain,
                     'Light rain shower': :light_rain,
                     'Patchy rain possible': :light_rain, 'Light snow': :light_snow, 'Clear': :clear,
                     'Moderate or heavy snow showers': :snow, 'Fog': :fog,
                     'Thundery outbreaks possible': :light_thunder, 'Thundery': :thunder_storm
                    }.freeze

    def initialize(weather_obj)
      @weather_obj = weather_obj
    end

    def print_to_console
      return puts error if error
      puts current_weather
      forecast_summary if @weather_obj.forecast
      forecast_weather if @weather_obj.forecast
    end

    def current_weather
      "\e[1m\n#{current_symbols}\n
         #{@weather_obj.location.name}  |  #{@weather_obj.location.country}\n
         #{@weather_obj.location.localtime}\n
         Humidity: #{@weather_obj.current.humidity}% | #{weather_condition}\n
         Temperature: #{@weather_obj.current.temp_c} Celcius | #{@weather_obj.current.temp_f } Fahrenheit
      \e[0m
      "
    end

    def print_report(report)
      "\e[1m\n#{current_symbols}\n
      Time: #{report.time}\n
      Humidity: #{report.humidity}% | #{report.condition.text}\n
      Temperature: #{report.temp_c} Celcius | #{report.temp_f } Fahrenheit
      \e[0m
        "
    end

    def forecast_weather
      hourly_reports = forecast_data.first.hour
      hourly_reports.values_at(7,15,23).each{ |report| puts print_report(report) }
    end

    def forecast_summary
      "#{print_dash_30}| SUMMARY |#{print_dash_30}
      \e[1m\n#{forecast_symbols}\n
      Temp in Celcius: #{summary.maxtemp_c} - #{summary.mintemp_c}(max - min) | #{summary.avgtemp_c} (avg)\n
      Avg. Humidity: #{summary.avghumidity}% | #{summary.condition.text}\n
      Sunrise: #{forecast_astro.sunrise} | Sunset: #{forecast_astro.sunset}\n
      Moonrise: #{forecast_astro.moonrise} | Moonset: #{forecast_astro.moonset}
      \e[0m
      #{print_dash_30}| FORECAST |#{print_dash_30} "
    end

    def current_symbols
      self.send(WEATHER_TEXT[weather_condition.to_sym])
    end

    def report_sumbols
      self.send(WEATHER_TEXT[report.condition.text.to_sym])
    end

    def forecast_symbols
      self.send(WEATHER_TEXT[summary.condition.text.to_sym])
    end

    def summary
      forecast_data.first.day
    end

    def forecast_astro
      forecast_data.first.astro
    end

    def print_dash_30
      '-' * 30
    end

    def forecast_data
      @weather_obj.forecast.forecastday
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
  end
end
