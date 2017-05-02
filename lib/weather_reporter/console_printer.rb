module WeatherReporter
  include OutputFormatter

  class ConsolePrinter
    def initialize(weather_obj)
      @weather_obj = weather_obj
    end

    def print_to_console
       puts(condition_map[:"#{weather_condition}"])
    end

    def weather_condition
      @weather_obj.current.condition.text
    end

    def condition_map
      {
        "Sunny": sunny,
        "Overcast": cloudy,
        "Mist": mist,
        "Partly cloudy": partly_cloudy,
        "Light rain": light_rain,
        "Light rain shower": light_rain,
        'Patchy rain possible': light_rain
      }
    end

  end
end
