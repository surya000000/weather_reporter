module WeatherReporter
  module OutputFormatter
      def sunny
        '
          \  /
        -- ⚪  --
          /  \
        '
      end

     def partly_cloudy
        '         \  /
        --⚪  .---.
         /.-(     ).
          (___.__)__)'
      end

      def light_rain
        "\t  _`/"".-.
          ,\_(   ).
           /(___(__)
           ‘ ‘ ‘ ‘
          ‘ ‘ ‘ ‘ "
      end

      def snow
        "\t    .-.
           (   ).
          (___(__)
          ❉ ❉ ❉ ❉
         ❉ ❉ ❉ ❉ "
      end

      def light_snow
        '         \  /
        --⚪  .---.
         /.-(     ).
          (___.__)__)
          ❉ ❉ ❉ ❉ ❉ '
      end

      def clear
        sunny
      end

      def cloudy
         "\t   .--.-.
          ( (    )__
         (_,  \ ) ,_)
           '-'--`--' "
      end

      def fog
        "\t _ - _ - _ -
         _ - _ - _
         _ - _ - _ -"
      end

      def mist
      '_ - _ - _
      _ - _ - _ -'
      end

  end
end
