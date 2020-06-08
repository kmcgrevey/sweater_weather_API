class Api::V1::FoodieController < ApplicationController

  def show
    # binding.pry
    foodie = FoodieFinder.get_food_info(trip_params)
  end

  private

   def trip_params
    params.permit(:start, :end, :search)
  end

end