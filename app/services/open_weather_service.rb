class OpenWeatherService

  def self.location_weather(latlong_data)
    resp = Faraday.get("https://api.openweathermap.org/data/2.5/onecall") do |req|
      req.params['lat'] = latlong_data.lat
      req.params['lon'] = latlong_data.long
      req.params['units'] = 'imperial'
      req.params['exclude'] = 'minutely'
      req.params['appid'] = ENV['OPENWX_API_KEY']
    end
    
    JSON.parse(resp.body, symbolize_names: true)
  end

  def self.hourly_forecast(weather)
    hourly = []
    wx_list = weather[:hourly].first(8)
    wx_list.each_with_index do |hour, index|
      hourly << HourlyForecast.new(hour, index)
    end
    hourly
  end
end