class GeocodeService

    def self.get_geocode(location)
      json_resp = Faraday.get("https://maps.googleapis.com/maps/api/geocode/json?address=denver, co") do |req|
        req.params['key'] = ENV['GOOG_GEO_API']
      end
      JSON.parse(json_resp.body, symbolize_names: true)
    end

end