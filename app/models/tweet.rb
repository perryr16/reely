class Tweet < ApplicationRecord
  belongs_to :twitter_user
  belongs_to :movie

  def self.get_tweets_about(movie_title)
    tweet_data = TwitterService.new.get_tweets(movie_title + " movie")
    tweets = tweet_data[:data]
    twitter_user_data = tweet_data[:includes][:users]
    # tweets.each do |tweet|
    #   Tweet.create(

    #   )
    #       Comment.create(
    #   comment: params[:comment],
    #   image_url: current_user.photo,
    #   user_id: current_user.id,
    #   movie_id: params[:format]
    # )
    # end
  end
end
