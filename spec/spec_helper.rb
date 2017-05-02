$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'weather_reporter'
require 'helpers/weather_symbol'
require 'webmock/rspec'
require 'pry'

WebMock.disable_net_connect!(allow_localhost: true)

RSpec.configure do |config|
  # json = JSON.parse(File.read("spec/fixtures/weather.json"))
  config.before(:each) do
    stub_request(:get, "http://api.apixu.com/v1/current.json?key=5f7c4e53a0d645d382a14830173004&q=kathmandu").
    with(headers: {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent'=>'Ruby'}).
    to_return(status: 200, body: '{"location": {"name": "Kathmandu"} }', headers: {})
  end
end
