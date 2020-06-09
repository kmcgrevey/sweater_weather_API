class FoodieSerializer
  include FastJsonapi::ObjectSerializer
  
  attributes :travel_time,
             :id
end