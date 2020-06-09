require 'rails_helper'

describe 'Foodie API' do
  it 'can return end city, travel time, restaurant info and wx' do

    get '/api/v1/foodie?start=denver,co&end=pueblo,co&search=italian'

    expect(response).to be_successful

    json = JSON.parse(response.body, symbolize_names: true )
   
    expect(json[:data][:attributes]).to have_key(:travel_time)
    expect(json[:data][:attributes]).to have_key(:restaurant)
    expect(json[:data][:attributes]).to have_key(:end_location)
    expect(json[:data][:attributes]).to have_key(:forecast)
  end
end

# {
#   "data": {
#     "id": "null",
#     "type": "foodie",
#     "attributes": {
#       "end_location": "pueblo,co",
#       "travel_time": "1 hours 48 min",
#       "forecast": {
#         "summary": "Cloudy with a chance of meatballs",
#         "temperature": "83"
#       },
#       "restaurant": {
#         "name": "Angelo's Pizza Parlor",
#         "address": "105 E Riverwalk, Pueblo 81003"
#       }
#     }
#   }
# }