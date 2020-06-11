class ForecastFinder
  class << self
    def get_forecast(location)
      weather = OpenWeatherService.location_weather(location)
      hourly_wx = hourly_forecast(weather)
      daily_wx = daily_forecast(weather)
      current_wx = CurrentForecast.new(weather)
    
      Forecast.new(location, hourly_wx, daily_wx, current_wx)
    end

    def hourly_forecast(weather)
      hourly = []
      wx_list = weather[:hourly].first(8)
      wx_list.each_with_index do |hour, index|
        hourly << HourlyForecast.new(hour, index)
      end
      hourly
    end

    def daily_forecast(weather)
      daily = []
      wx_list = weather[:daily].first(5)
      wx_list.each_with_index do |day, index|
        daily << DailyForecast.new(day, index)
      end
      daily
    end
  end 
end