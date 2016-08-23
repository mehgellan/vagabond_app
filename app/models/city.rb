class City < ApplicationRecord
  has_many :posts

  def self.find_by_slug(slug)
    find_by_city(slug.gsub('-', ' ').titleize)
  end

  def to_param
    city.downcase.gsub(" ", "-")
  end

  alias_method :city, :name

  # def name
  #   city
  # end

end
