module WeatherReporter
  module OutputFormatter
    # class << self
      def sunny
        '
          \  /
        -- ⚪  --
          /  \
        '
      end

      def cloudy
        "\t .-.
        (   ).
        (___(__)
        ‘ ‘ ‘ ‘
       ‘ ‘ ‘ ‘"
      end

      def light_rain
        "\t  _`/"".-.
          ,\_(   ).
           /(___(__)
           ‘ ‘ ‘ ‘
          ‘ ‘ ‘ ‘ "
      end

      def partly_cloudy
         '          \  /
        _ /"".-.
          \_(   ).
          /(___(__)'
      end
    # end
  end
end
