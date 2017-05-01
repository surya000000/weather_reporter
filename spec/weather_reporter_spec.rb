require 'spec_helper'

RSpec.describe WeatherReporter do
  it 'has a version number' do
    expect(WeatherReporter::VERSION).not_to be('0.1.0')
  end
end
