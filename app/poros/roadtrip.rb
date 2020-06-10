class Roadtrip
  attr_reader :id,
              :origin,
              :destination,
              :travel_time,
              :arrival_forecast
  
  def initialize(origin, destination, travel_time, forecast)
    @id = 'null'
    @origin = origin
    @destination = destination
    @travel_time = travel_time
    @arrival_forecast = forecast
  end
end