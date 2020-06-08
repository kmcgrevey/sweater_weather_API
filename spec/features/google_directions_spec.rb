require 'rails_helper'

describe 'Google Directions API' do
  it 'can return travel time between cities' do
    start = 'denver, co'
    finish = 'pueblo, co'
    # expected = {}
  
    time = DirectionsService.travel_time(start, finish)
  
    expect(time[:data][:attributes][:travel_time]).to be_a(String)
  end
end