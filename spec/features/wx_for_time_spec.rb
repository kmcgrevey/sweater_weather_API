require 'rails_helper'

describe 'OpenWeather API' do
  xit 'can return weather for given time' do
    # travel_time = '1 hour 48 mins'
    location = 'pueblo, co'
    unix_time = 1591653600
    # for 06/08/2020 4 PM local Denver
  
    wx = DestinationForecast.arrival_wx(location, unix_time)
  end
end