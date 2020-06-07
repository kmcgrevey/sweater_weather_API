require 'rails_helper'

describe 'Weather API' do
  it 'can retrieve a forecast for a given city' do
    location = 'denver, co'

    get "/api/v1/forecast?location=#{location}"

    expect(response).to be_successful
  end
end