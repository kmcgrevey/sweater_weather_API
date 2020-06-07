class ForecastFinder

  def self.get_forecast(location)
    latlong_data = LatLong.new(location)
    weather = OpenWeatherService.location_weather(latlong_data)
    hourly_wx = OpenWeatherService.hourly_forecast(weather)
    daily_wx = OpenWeatherService.daily_forecast(weather)
    Forecast.new(location, hourly_wx, daily_wx)
  end

end