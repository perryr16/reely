require 'i18n'
class Movie < ApplicationRecord
  
  has_many :movie_actors
  has_many :actors, through: :movie_actors
  has_many :movie_directors
  has_many :directors, through: :movie_directors
  has_many :user_movies
  has_many :users, through: :user_movies

  def director_list
    directors.map(&:name).uniq.join(', ')
  end
  def actor_list 
    actors.map(&:name).uniq.join(', ')
  end

  def add_crew(actors, directors)
    if self.actors == []
      actors.each do |actor|
        self.actors << Actor.create(name: actor)
      end
    end
    if self.directors == []
      directors.each do |director|
        binding.pry
        self.directors << Director.create(name: director)
      end
    end
  end
end
