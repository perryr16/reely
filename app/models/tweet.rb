class Tweet < ApplicationRecord
  belongs_to :twitter_user
  belongs_to :movie

  def self.get_tweets_about(movie_title)
    
  end
end
