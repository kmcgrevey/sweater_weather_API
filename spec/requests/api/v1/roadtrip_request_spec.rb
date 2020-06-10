require 'rails_helper'

describe 'Roadtrip API' do
  it 'can return origin, destination, travel time and destination wx' do
    body = {
              "origin": "Denver,CO",
              "destination": "Pueblo,CO",
              "api_key": "jgn983hy48thw9begh98h4539h4"
            }
    
    
    post '/api/v1/road_trip', params: body


    expect(response).to be_successful

    json = JSON.parse(response.body, symbolize_names: true )
   
    expect(json[:data][:type]).to eq("roadtrip")
    expect(json[:data][:attributes]).to have_key(:origin)
    expect(json[:data][:attributes]).to have_key(:destination)
    expect(json[:data][:attributes]).to have_key(:destination)
    expect(json[:data][:attributes]).to have_key(:arrival_forecast)
    expect(json[:data][:attributes][:arrival_forecast]).to have_key(:summary)
    expect(json[:data][:attributes][:arrival_forecast]).to have_key(:temp)
  end
end

# SAMPLE OF RESPONSE
# {
#   "data": {
#     "id": "null",
#     "type": "roadtrip",
#     "attributes": {
#       "origin": "denver,co",
#       "destination": "pueblo,co",
#       "destination": "1 hours 48 min",
#       "arrival_forecast": {
#         "summary": "Mostly Sunny",
#         "temp": "74"
#       }
#     }
#   }
# }