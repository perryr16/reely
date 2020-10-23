class UserMovie < ApplicationRecord
  belongs_to :user
  belongs_to :movie

  def self.user_movie_exists?(user_id, movie_id)
    UserMovie.find_by(movie_id: movie_id, user_id: user_id).present?
  end
end
