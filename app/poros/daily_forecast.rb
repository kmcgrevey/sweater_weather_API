class DailyForecast
  attr_reader :date,
              :day,
              :icon,
              :adjective,
              :rain,
              :temp_high,
              :temp_low,
              :id
  
  def initialize(daily_wx, index)
    @date = Time.at(daily_wx[:dt]).strftime("%d/%m/%Y")
    @day = Time.at(daily_wx[:dt]).strftime("%A")
    @icon = daily_wx[:weather].first[:icon]
    @adjective = daily_wx[:weather].first[:main]
    @rain = daily_wx[:rain]
    @temp_high = daily_wx[:temp][:max].to_i
    @temp_low = daily_wx[:temp][:min].to_i
    @id = index
  end
end