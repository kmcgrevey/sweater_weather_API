class Background
  attr_reader :background_link, :id
  
  def initialize(location)
    @background_link = find_background(location)
    @id = 1
  end

  private

  def find_background(location)
    BackgroundService.get_background(location)
  end

end