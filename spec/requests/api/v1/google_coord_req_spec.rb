require 'rails_helper'

describe 'Google Geocoding API' do
  it 'can return lat and long for a given city' do
    location = 'Denver, CO'
    expected = {:lat=>39.7392358, :lng=>-104.990251}
    json_resp = Faraday.get("https://maps.googleapis.com/maps/api/geocode/json?address=denver, co&key=AIzaSyBSh0Z_46DOE6XjhwOT3BCS4E8-qctg2dg")
    parsed = JSON.parse(json_resp.body, symbolize_names: true)
  
    expect(parsed[:results][0][:geometry][:location]).to eq(expected)
  end
end