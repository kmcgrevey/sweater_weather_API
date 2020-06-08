require 'rails_helper'

describe 'Foodie API' do
  it 'can return end city, travel time, restaruant info and wx' do

    get  '/api/v1/foodie?start=denver,co&end=pueblo,co&search=italian'

    expect(response).to be_successful
  end
end