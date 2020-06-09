class UserSerializer
  include FastJsonapi::ObjectSerializer
  
  attributes :email,
             :password,
             :api_key,
             :id
end