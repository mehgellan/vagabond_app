class City < ApplicationRecord
  has_many :posts
  has_many :users, through: :posts # TODO: remove
end
