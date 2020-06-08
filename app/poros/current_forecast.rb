class CurrentForecast
  attr_reader :time,
              :date,
              :icon,
              :adjective,
              :temp_current,
              :temp_high,
              :temp_low,
              :feels_like,
              :humidity,
              :visibility,
              :uvindex,
              :sunrise,
              :sunset,
              :id
  
  def initialize(weather)
    current = weather[:current]
   
    @time = Time.at(current[:dt]).strftime("%l:%M %p")
    @date = Time.at(current[:dt]).strftime("%B %e")
    @icon = current[:weather].first[:icon]
    @adjective = current[:weather].first[:main]
    @temp_current = current[:temp].to_i

    @temp_high = weather[:daily].first[:temp][:max].to_i
    @temp_low = weather[:daily].first[:temp][:min].to_i
    
    @feels_like = current[:feels_like].to_i
    @humidity = current[:humidity].to_i
    @visibility = current[:visibility].to_i
    @uvindex = current[:uvi].to_i
    @sunrise = Time.at(current[:sunrise]).strftime("%l:%M %p")
    @sunset = Time.at(current[:sunset]).strftime("%l:%M %p")
    @id = 1
  end
end