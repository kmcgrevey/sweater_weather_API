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