class RoadtripSearch
  
  def self.make_trip(origin, destination)
    travel_time = DirectionsService.travel_time(origin, destination)
    forecast = DestinationWeather.new(destination)

    Roadtrip.new(origin, destination, travel_time, forecast)
  end
end