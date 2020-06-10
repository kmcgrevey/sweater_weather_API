class Api::V1::RoadtripController < ApplicationController

  def create
    # binding.pry
    roadtrip = RoadtripSearch.make_trip(origin, destination)
    render json: RoadtripSerializer.new(roadtrip)
  end

  private

  def origin
    params[:origin]
  end
  
  def destination
    params[:destination]
  end

end