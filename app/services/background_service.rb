class BackgroundService

  def self.get_background(location)
    city = location.split(',').first
    json_resp = Faraday.get("https://api.teleport.org/api/urban_areas/slug:#{city}/images")
    image_info = JSON.parse(json_resp.body, symbolize_names: true)
    
    background_link(image_info)
  end

  private

  def self.background_link(image_info)
    image_info[:photos].first[:image][:web]
  end

end