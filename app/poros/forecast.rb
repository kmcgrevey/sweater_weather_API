class Forecast
  attr_reader :location, :hourly_forecast
  
  def initialize(location, hourly_cast)
    @location = location
    @hourly_forecast = hourly_cast
  end
end