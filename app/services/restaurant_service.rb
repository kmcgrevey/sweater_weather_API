class RestaurantService

  def self.find_restaurant(location)
    coords = LatLong.new(location)
  
    json_resp = Faraday.get("https://developers.zomato.com/api/v2.1/search?") do |req|
      req.params['lat'] = coords.lat
      req.params['lon'] = coords.long
      req.params['count'] = 1
      req.headers['user-key'] = ENV['ZOOMATO_API_KEY']
    end
    JSON.parse(json_resp.body, symbolize_names: true)
  end
end
