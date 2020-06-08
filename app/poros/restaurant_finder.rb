class RestaurantFinder

  def self.get_restaurant(location)
    coords = LatLong.new(location)
    lat = coords.lat
    lon = coords.long
    binding.pry

  end

end