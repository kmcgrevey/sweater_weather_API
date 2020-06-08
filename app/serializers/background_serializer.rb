class BackgroundSerializer
  include FastJsonapi::ObjectSerializer
  
  attributes :background_link, :id
end