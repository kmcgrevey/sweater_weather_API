class FoodieFinder

  def self.get_food_info(trip_params)
    travel_time = DirectionsService.travel_time(trip_params[:start], trip_params[:end])
    binding.pry
  end

end