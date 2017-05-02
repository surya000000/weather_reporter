module WeatherReporter
  RSpec.describe ConsolePrinter do
    describe '#print_to_console' do
      it 'prints error for invalid city' do
        weather_obj = OpenStruct.new({ error: 400, text: 'q is missing' })
        expect(WeatherReporter::ConsolePrinter.new(weather_obj).print_to_console)
      end
    end
  end
end
