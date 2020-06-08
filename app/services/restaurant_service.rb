class RestaurantService

  def self.find_restaurant(location)
    coords = LatLong.new(location)
  binding.pry
    json_resp = Faraday.get("") do |req|
      req.params['lat'] = coords.lat
      req.params['lon'] = coords.long
      req.params['user-key'] = ENV['ZOOMATO_API_KEY']
    end
    JSON.parse(json_resp.body, symbolize_names: true)
  end
end