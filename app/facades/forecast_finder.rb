class ForecastFinder

  def self.get_forecast(location)
    hourly_wx = OpenWeatherService.hourly_forecast(location)
    daily_wx = OpenWeatherService.daily_forecast(location)
    current_wx = OpenWeatherService.current_forecast(location)
  
    Forecast.new(location, hourly_wx, daily_wx, current_wx)
  end

end