class User < ApplicationRecord

  def generate_key
    key = [*('a'..'z'),*('0'..'9')].shuffle[0,27].join
    update_column(:api_key, key)
  end
end