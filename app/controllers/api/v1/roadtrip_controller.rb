class Api::V1::RoadtripController < ApplicationController

  def create
    user = User.find_by(api_key: user_api_key)
   
    if user
      roadtrip = RoadtripSearch.make_trip(origin, destination)
      render json: RoadtripSerializer.new(roadtrip)
    else
      render json: {error: "Unauthorized",
                    status: 401},
                    status: 401
    end
  end

  private

  def origin
    params[:origin]
  end
  
  def destination
    params[:destination]
  end
  
  def user_api_key
    params[:api_key]
  end

end