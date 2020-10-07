class Movie < ApplicationRecord
  has_many :movie_actors
  has_many :actors, through: :movie_actors
  has_many :movie_directors
  has_many :directors, through: :movie_directors

  def director_list
    directors.map(&:name).uniq.join(', ')
  end
  def actor_list 
    actors.map(&:name).uniq.join(', ')
  end
end
