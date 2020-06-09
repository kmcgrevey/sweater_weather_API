require 'rails_helper'

describe 'Login Request' do
  it 'returns a users api key' do
    login_params = {
                    "email": "whatever@example.com",
                    "password": "password"
                    }

  
    post '/api/v1/sessions', params: login_params

    expect(response).to be_successful

  end
end