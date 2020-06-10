require 'rails_helper'

describe 'Registration Request' do
  before(:each) do
    User.create(email: "alreadyhere@example.com",
                       password: "snoopy")
  end
  
  it 'can create a user and return unique assigned api key' do
    body = {
            "email": "whatever@example.com",
            "password": "password",
            "password_confirmation": "password"
           }
  
    post '/api/v1/users', params: body

    expect(response).to be_successful
    expect(response.status).to eq(201)
    
    json = JSON.parse(response.body, symbolize_names: true )
 
    expect(json[:data][:type]).to eq("user")
    expect(json[:data]).to have_key(:id)
    expect(json[:data][:attributes]).to have_key(:email)
    expect(json[:data][:attributes]).to have_key(:api_key)
    expect(json[:data][:attributes]).not_to have_key(:password)
  end
  
  xit 'returns error status and description for invalid email' do
    reg_params = {
                  "email": "alreadyhere@example.com",
                  "password": "password",
                  "password_confirmation": "password"
                  }

    post '/api/v1/sessions', params: reg_params

    expect(response).not_to be_successful
    expect(response.status).to eq(401)

    json = JSON.parse(response.body, symbolize_names: true )
    expect(json[:error]).to eq("credentials are bad")
    expect(json[:status]).to eq(401)
  end
end

# status: 201
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