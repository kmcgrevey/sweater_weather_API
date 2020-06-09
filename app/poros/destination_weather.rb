class DestinationWeather
  attr_reader :summary, :tempurature

  def initialize(weather)
    dest_wx = OpenWeatherService.current_forecast(weather)
    @summary = dest_wx.adjective
    @temperature = dest_wx.temp_current
  end

end
