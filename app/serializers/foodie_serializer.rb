class FoodieSerializer
  include FastJsonapi::ObjectSerializer
  
  attributes :travel_time,
             :restaurant,
             :id
end