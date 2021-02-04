class Tweet < ApplicationRecord
  belongs_to :twitter_user
  belongs_to :movie

  def self.get_tweets_about(movie)
    tweet_data = TwitterService.new.get_tweets(movie.title + " movie")
    TwitterUser.create_twitter_users(tweet_data[:includes][:users])
    tweets = tweet_data[:data]
    Tweet.create_tweets(tweets, movie)
  end

  def self.create_tweets(tweets_data, movie)
    tweets_data.each do |tweet|
      twitter_user = TwitterUser.find_by(author_id: tweet[:author_id])
      Tweet.create(
        text: tweet[:text],
        tweet_id: tweet[:id],
        twitter_user: twitter_user,
        movie: movie,
      )
    end
  end
end
