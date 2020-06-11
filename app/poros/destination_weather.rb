class DestinationWeather
  attr_reader :summary, :tempurature

  def initialize(destination)
    dest_wx = future_forecast(destination)
    @summary = dest_wx.adjective
    @temperature = dest_wx.temp_current
  end

  def future_forecast(destination)
    weather = OpenWeatherService.location_weather(destination)
    current_wx = CurrentForecast.new(weather)
  end
end