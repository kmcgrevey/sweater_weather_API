require 'rails_helper'

describe 'Background image API' do
  it 'can retrieve an image for a given city' do
    location = 'denver, co'

    get "/api/v1/backgrounds?location=#{location}"

    expect(response).to be_successful

    json = JSON.parse(response.body, symbolize_names: true )

    expect(json[:data][:attributes][:background_link]).to have_content("http")
  end
end