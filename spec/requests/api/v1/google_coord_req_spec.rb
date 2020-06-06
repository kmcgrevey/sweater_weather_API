require 'rails_helper'

describe 'Google Geocoding API' do
  it 'can return lat and long for a given city' do
    location = 'Denver, CO'
    # expected = {"lat" : 39.91424689999999, "lng" : -104.6002959}
    json_resp = Faraday.get("https://maps.googleapis.com/maps/api/geocode/json?address=denver, co&key=AIzaSyBSh0Z_46DOE6XjhwOT3BCS4E8-qctg2dg")
  binding.pry
  end
end