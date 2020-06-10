require 'rails_helper'

describe 'Roadtrip API' do
  before(:each) do
    @user = User.create(email: "whatever@example.com",
                        password: "password")
  end
  
  it 'can return origin, destination, travel time and destination wx' do
    body = {
              "origin": "Denver,CO",
              "destination": "Pueblo,CO",
              "api_key": "#{@user.api_key}"
            }
    
    post '/api/v1/road_trip', params: body

    expect(response).to be_successful
    
    json = JSON.parse(response.body, symbolize_names: true )
    
    expect(json[:data][:type]).to eq("roadtrip")
    expect(json[:data][:attributes]).to have_key(:origin)
    expect(json[:data][:attributes]).to have_key(:destination)
    expect(json[:data][:attributes]).to have_key(:travel_time)
    expect(json[:data][:attributes]).to have_key(:arrival_forecast)
    expect(json[:data][:attributes][:arrival_forecast]).to have_key(:summary)
    expect(json[:data][:attributes][:arrival_forecast]).to have_key(:temperature)
  end

  it 'will return an error code and message for invalid api key' do
    body = {
              "origin": "Denver,CO",
              "destination": "Pueblo,CO",
              "api_key": "1234567890"
            }
    
    post '/api/v1/road_trip', params: body

    expect(response).not_to be_successful
    expect(response.status).to eq(401)

    json = JSON.parse(response.body, symbolize_names: true )
    
    expect(json[:error]).to eq("Unauthorized")
    expect(json[:status]).to eq(401)
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
#       "travel_time": "1 hours 48 min",
#       "arrival_forecast": {
#         "summary": "Mostly Sunny",
#         "temperature": 74
#       }
#     }
#   }
# }