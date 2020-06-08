class RestaurantFinder

  def self.get_restaurant(location)
    # coords = LatLong.new(location)
    # lat = coords.lat
    # lon = coords.long
    restaurant_info = RestaurantService.find_restaurant(location)
    binding.pry

  end

end