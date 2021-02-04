require 'rails_helper'

RSpec.describe Tweet, type: :model do
  it {should belong_to :twitter_user}
  it {should belong_to :movie}

  it "creates tweets form a movie title" do 
    movie = Movie.create(
      title: "Fight Club",
      year: 1999,
      rating: 9.0,
      imdb: "8.8",
      rotten: "79%",
      metacritic: "66%",
      trailer: 'www.trailer.com',
      description: "edward norton talks to himself",
      imdb_id: '1234',
      rated: "R",
      genre: "Drama/Thriller",

    )
    expect(Tweet.all.length).to eq(0)
    expect(TwitterUser.all.length).to eq(0)
    
    Tweet.get_tweets_about(movie)

    expect(Tweet.all.length).to eq(10)
    expect(TwitterUser.all.length > 0).to eq(true)
    expect(movie.tweets.length).to eq(10)
    expect(TwitterUser.first.tweets).to be_truthy



  end
end
