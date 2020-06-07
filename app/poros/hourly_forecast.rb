class HourlyForecast
  attr_reader :date, :hour, :icon, :temp
  
  def initialize(hourly_wx)
    @date = Time.at(hourly_wx[:dt]).strftime("%d/%m/%Y")
    @hour = Time.at(hourly_wx[:dt]).strftime("%l %p")
    @icon = hourly_wx[:weather].first[:icon]
    @temp = hourly_wx[:temp].to_i
  end

end