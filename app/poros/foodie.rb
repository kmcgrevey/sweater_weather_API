class Foodie
  attr_reader :id, :travel_time
  
  def initialize(travel_time)
    @id = 1
    @travel_time = travel_time
    # @temperature = dest_wx.temp_current
    # @summary = dest_wx.adjective
  end

end