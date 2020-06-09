class Foodie
  attr_reader :id, :travel_time, :restaurant
  
  def initialize(travel_time, restaurant_info)
    @id = 1
    @travel_time = travel_time
    # @temperature = dest_wx.temp_current
    # @summary = dest_wx.adjective
    @restaurant = restaurant_info
  end

end