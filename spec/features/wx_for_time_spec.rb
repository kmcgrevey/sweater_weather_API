require 'rails_helper'

describe 'OpenWeather API' do
  it 'can return weather for given time' do
    # travel_time = '1 hour 48 mins'
    location = 'pueblo, co'
    clock_time = "??"
  
    wx = DirectionsService.travel_time(start, finish)
    expect(time[:routes].first[:legs].first[:duration][:text]).to be_a(String)
  end
end