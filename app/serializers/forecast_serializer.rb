class ForecastSerializer
  include FastJsonapi::ObjectSerializer
  
  attributes :location,
             :hourly_forecast,
             :daily_forecast,
             :id
end