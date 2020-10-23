class User < ApplicationRecord
  has_many :user_movies
  has_many :movies, through: :user_movies

  def self.from_omniauth(auth)
    find_or_create_by(email: auth.info.email) do |user|
      user.name = auth.info.name
      user.email = auth.info.email
      user.photo = auth.info.image
      user.google_token = auth.credentials.token
    end
  end
end
