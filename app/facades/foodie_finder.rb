class FoodieFinder

  def self.get_food_info(trip_params)
    travel_time = DirectionsService.travel_time(trip_params[:start], trip_params[:end])
    
    restaurant = RestaurantService.find_restaurant(trip_params[:end])
    restaurant_info = Restaurant.new(restaurant)
    
    latlong_data = LatLong.new(trip_params[:end])
    weather = OpenWeatherService.location_weather(latlong_data)
    forecast = DestinationWeather.new(weather)
    
    end_location = trip_params[:end]
    
    Foodie.new(travel_time, restaurant_info, end_location, forecast)
  end

end