class Forecast
  attr_reader :location,
              :hourly_forecast,
              :daily_forecast,
              :current_forecast,
              :id
  
  def initialize(location, hourly_wx, daily_wx, current_wx)
    @location = location
    @hourly_forecast = hourly_wx
    @daily_forecast = daily_wx
    @current_forecast = current_wx
    @id = 1
  end
end