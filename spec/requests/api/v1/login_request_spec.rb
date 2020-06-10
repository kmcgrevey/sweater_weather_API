require 'rails_helper'

describe 'Login Request' do
  before(:each) do
    User.create(email: "whatever@example.com",
                       password: "password")
  end
  
  it 'returns a users api key' do
    login_params = {
                    "email": "whatever@example.com",
                    "password": "password"
                    }

  
    post '/api/v1/sessions', params: login_params

    expect(response).to be_successful
    expect(response.status).to eq(200)
  
    json = JSON.parse(response.body, symbolize_names: true )
    
    expect(json[:data][:type]).to eq("user")
    expect(json[:data]).to have_key(:id)
    expect(json[:data][:attributes]).to have_key(:email)
    expect(json[:data][:attributes]).to have_key(:api_key)
  end

  it 'returns error status and description for unsuccessful request' do
    login_params = {
                    "email": "",
                    "password": ""
                    }

    post '/api/v1/sessions', params: login_params

    expect(response).not_to be_successful
    expect(response.status).to eq(401)

    json = JSON.parse(response.body, symbolize_names: true )
    expect(json[:error]).to eq("credentials are bad")
    expect(json[:status]).to eq(401)
  end
end

# status: 200
# body:

# {
#   "data": {
#     "type": "users",
#     "id": "1",
#     "attributes": {
#       "email": "whatever@example.com",
#       "api_key": "jgn983hy48thw9begh98h4539h4"
#     }
#   }
# }