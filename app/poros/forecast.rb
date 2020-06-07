class Forecast
  attr_reader :location, :hourly_forecast, :id
  
  def initialize(location, hourly_cast)
    @location = location
    @hourly_forecast = hourly_cast
    @id = 1
  end
end