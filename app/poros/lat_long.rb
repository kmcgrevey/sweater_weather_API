class LatLong
  attr_reader :lat, :long
  
  def initialize(location)
    coords = get_lat_long(location)
    @lat = coords[:lat]
    @long = coords[:lng]
  end
    
  private

  def get_lat_long(location)
    geo_data = GeocodeService.get_geocode(location)
    geo_data[:results][0][:geometry][:location]
  end
end