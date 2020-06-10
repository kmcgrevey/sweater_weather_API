class User < ApplicationRecord
  before_create :generate_key
  validates :email, uniqueness: true, presence: true
  
  def generate_key
    self.api_key = [*('a'..'z'),*('0'..'9')].shuffle[0,27].join
  end

end