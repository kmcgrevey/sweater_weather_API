require 'rails_helper'

describe 'Zoomato API' do
  it 'can return a restaurant from a given location' do
    location = 'pueblo, co'
  
    restaurant = RestaurantFinder.get_restaurant(location)
  binding.pry
  end
end