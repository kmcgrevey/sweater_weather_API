class RoadtripSearch
  
  def self.make_trip(origin, destination)
    travel_time = DirectionsService.travel_time(origin, destination)
    
    latlong_data = LatLong.new(destination)
    weather = OpenWeatherService.location_weather(latlong_data)
    forecast = DestinationWeather.new(weather)

    Roadtrip.new(origin, destination, travel_time, forecast)
  end
end