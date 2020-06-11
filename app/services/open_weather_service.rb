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
end