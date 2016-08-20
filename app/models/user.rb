class User < ApplicationRecord
  has_secure_password
  has_many :posts
  has_many :cities, through: :posts # TODO: remove
  def self.confirm(params)
    @user = User.find_by({email: params[:email]})
    @user.try(:authenticate, params[:password])
  end
end
