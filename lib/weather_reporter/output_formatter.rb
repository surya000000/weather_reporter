module WeatherReporter
  class OutputFormatter
    class << self
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

      def partial_rainy
        "\t  _`/"".-.
          ,\_(   ).
           /(___(__)
           ‘ ‘ ‘ ‘
          ‘ ‘ ‘ ‘ "
      end

      def partial_cloudy
         '          \  /
        _ /"".-.
          \_(   ).
          /(___(__)'
      end
    end
  end
end
