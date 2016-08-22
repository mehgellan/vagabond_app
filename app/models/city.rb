class City < ApplicationRecord
  has_many :posts


  def to_param
    city.downcase.gsub(" ", "-")
  end

end
