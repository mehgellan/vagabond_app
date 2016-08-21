class Post < ApplicationRecord

  belongs_to :user
  belongs_to :city

  validates :title, presence: true, length: { minimum: 1,  maximum: 200 }

  validates :text, presence: true, length: { minimum: 1, maximum: 10000 }

end
