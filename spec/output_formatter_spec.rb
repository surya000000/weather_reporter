module WeatherReporter
  RSpec.describe OutputFormatter do

    include Helpers::WeatherSymbol

    let(:output_formatter_class) { WeatherReporter::OutputFormatter }

    describe '.sunny' do
      it 'prints sunny symbol' do
        expect(sunny).to(eq(output_formatter_class.sunny))
      end
    end

    describe '.partial_cloudy' do
      it 'prints partial cloudy symbol' do
        expect(partial_cloudy).to(eq(output_formatter_class.partial_cloudy))
      end
    end

    describe '.partial_rainy' do
      it 'prints partial rainy symbol' do
        expect(partial_rainy).to(eq(output_formatter_class.partial_rainy))
      end
    end

    describe '.cloudy' do
      it 'prints cloudy symbol' do
        expect(cloudy).to(eq(output_formatter_class.cloudy))
      end
    end
  end
end
