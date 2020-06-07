require 'rails_helper'

describe 'Google Geocoding API' do
  it 'can return lat and long for a given city' do
    location = 'Denver, CO'
    expected = {:lat=>39.7392358, :lng=>-104.990251}
  
    geocode = GeocodeService.get_geocode(location)
  
    expect(geocode[:results][0][:geometry][:location]).to eq(expected)
  end
end