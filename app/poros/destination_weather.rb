class DestinationWeather
  attr_reader :summary, :tempurature

  def initialize(destination)
    dest_wx = OpenWeatherService.current_forecast(destination)
    @summary = dest_wx.adjective
    @temperature = dest_wx.temp_current
  end

end