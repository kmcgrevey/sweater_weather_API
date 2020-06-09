class Restaurant
  attr_reader :name, :address
  
  def initialize(restaurant_info)
    @name = restaurant_info[:restaurants].first[:restaurant][:name]
    @address = restaurant_info[:restaurants].first[:restaurant][:location][:address]
    # @city = restaurant[:restaurants].first[:restaurant][:location][:city]
    # @zipcode = restaurant[:restaurants].first[:restaurant][:location][:zipcode]
  end
end