require 'rails_helper'

describe 'Registration Request' do
  it 'can create a user and return unique assigned api key' do
    reg_params = {
                    email: "whatever@example.com",
                    password: "password",
                    password_confirmation: "password"
                  }

  
    post '/api/v1/users', params: reg_params

    expect(response).to be_successful
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