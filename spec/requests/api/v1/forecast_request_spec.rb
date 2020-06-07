require 'rails_helper'

describe 'Weather API' do
  it 'can retrieve a forecast for a given city' do
    location = 'denver, co'

    get "/api/v1/forecast?location=#{location}"

    expect(response).to be_successful
   
    json = JSON.parse(response.body, symbolize_names: true )

    expect(json).to be_a(Hash)
    expect(json[:data][:attributes][:location]).to eq(location)
    expect(json[:data][:attributes][:hourly_forecast].count).to eq(8)
  end
end