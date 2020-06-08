require 'rails_helper'

describe 'Google Directions API' do
  it 'can return travel time between cities' do
    start = 'denver, co'
    finish = 'pueblo, co'
    # expected = {}
  
    time = DirectionsService.travel_time(start, finish)
  binding.pry
    expect(time[:routes].first[:legs][:duration][:text]).to be_a(String)
  end
end