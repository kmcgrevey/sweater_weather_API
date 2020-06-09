class Api::V1::FoodieController < ApplicationController

  def show
    # binding.pry
    foodie = FoodieFinder.get_food_info(trip_params)
    render json: FoodieSerializer.new(foodie)
  end

  private

   def trip_params
    params.permit(:start, :end, :search)
  end

end