class ForecastFinder

  def self.get_forecast(location)
    latlong_data = LatLong.new(location)
    weather = OpenWeatherService.location_weather(latlong_data)
    hourly_cast = OpenWeatherService.hourly_forecast(weather)
    Forecast.new(location, hourly_cast)
  end

end