class Api::V1::ForecastController < ApplicationController

  def show
    forecast = ForecastFinder.get_forecast(params[:location])
    binding.pry
  end

end