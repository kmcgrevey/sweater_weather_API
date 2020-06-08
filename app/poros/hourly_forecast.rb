class HourlyForecast
  attr_reader :date, :hour, :icon, :temp, :id
  
  def initialize(hourly_wx, index)
    @date = Time.at(hourly_wx[:dt]).strftime("%m/%d/%Y")
    @hour = Time.at(hourly_wx[:dt]).strftime("%l %p")
    @icon = hourly_wx[:weather].first[:icon]
    @temp = hourly_wx[:temp].to_i
    @id = index
  end

end