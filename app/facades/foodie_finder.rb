class FoodieFinder

  def self.get_food_info(trip_params)
    travel_time = DirectionsService.travel_time(trip_params[:start], trip_params[:end])
    
    latlong_data = LatLong.new(trip_params[:end])
    weather = OpenWeatherService.location_weather(latlong_data)
    destination_wx = OpenWeatherService.current_forecast(weather)
    
    # binding.pry
    Foodie.new(travel_time)
  end

end