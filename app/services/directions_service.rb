class DirectionsService

  def self.travel_time(origin, destination)
    json_resp = Faraday.get("https://maps.googleapis.com/maps/api/directions/json") do |req|
      req.params['origin'] = origin
      req.params['destination'] = destination
      req.params['key'] = ENV['GOOG_GEO_API']
    end
    time = JSON.parse(json_resp.body, symbolize_names: true)
    time[:routes].first[:legs].first[:duration][:text]
  end

end
