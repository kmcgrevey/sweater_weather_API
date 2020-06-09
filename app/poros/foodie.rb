class Foodie
  attr_reader :id, :travel_time, :restaurant, :end_location, :forecast
  
  def initialize(travel_time, restaurant_info, end_location, forecast)
    @id = 1
    @travel_time = travel_time
    # @temperature = dest_wx.temp_current
    # @summary = dest_wx.adjective
    @restaurant = restaurant_info
    @end_location = end_location
    @forecast = forecast
  end

end