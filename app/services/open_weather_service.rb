class OpenWeatherService

  def self.location_weather(location)
    latlong_data = LatLong.new(location)
    
    resp = Faraday.get("https://api.openweathermap.org/data/2.5/onecall") do |req|
      req.params['lat'] = latlong_data.lat
      req.params['lon'] = latlong_data.long
      req.params['units'] = 'imperial'
      req.params['exclude'] = 'minutely'
      req.params['appid'] = ENV['OPENWX_API_KEY']
    end
    
    JSON.parse(resp.body, symbolize_names: true)
  end

  def self.hourly_forecast(location)
    weather = self.location_weather(location)
    hourly = []
    wx_list = weather[:hourly].first(8)
    wx_list.each_with_index do |hour, index|
      hourly << HourlyForecast.new(hour, index)
    end
    hourly
  end

  def self.daily_forecast(location)
    weather = self.location_weather(location)
    daily = []
    wx_list = weather[:daily].first(5)
    wx_list.each_with_index do |day, index|
      daily << DailyForecast.new(day, index)
    end
    daily
  end

  def self.current_forecast(location)
    weather = self.location_weather(location)
    CurrentForecast.new(weather)
  end
end