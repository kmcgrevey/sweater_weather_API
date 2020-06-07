class ForecastSerializer
  include FastJsonapi::ObjectSerializer
  
  attributes :location, :hourly_forecast, :id
end