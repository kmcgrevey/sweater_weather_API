require 'rails_helper'

describe 'Login Request' do
  it 'returns a users api key' do
    user = User.create(email: "whatever@example.com",
                       password: "password")
    
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