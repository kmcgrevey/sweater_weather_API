require 'rails_helper'

describe 'Zoomato API' do
  it 'can return a restaurant from a given location' do
    location = 'pueblo, co'
  
    restaurant = RestaurantFinder.get_restaurant(location)

    name = restaurant[:restaurants].first[:restaurant][:name]
    address = restaurant[:restaurants].first[:restaurant][:location][:address]
    city = restaurant[:restaurants].first[:restaurant][:location][:city]
    zipcode = restaurant[:restaurants].first[:restaurant][:location][:zipcode]

    expect(name).to be_a(String)
    expect(address).to be_a(String)
    expect(city).to be_a(String)
    expect(zipcode).to be_a(String)
  end
end