require 'rails_helper'

describe "Create movie objects from API call" do

  before :each do 
    @results = ActorResults.new
  end

  it "creates base characteristics of a movie from best" do 
    @results.best_acted("brad pitt")
    movie1 = Movie.all[-1]
    movie2 = Movie.all[-2]
    expect(movie1).to_not equal(movie2)

    expect(movie1.id).to be_truthy
    expect(movie1.title).to be_truthy
    expect(movie1.year).to be_truthy
    expect(movie1.rating).to be_truthy
    expect(movie1.poster).to be_truthy
    expect(movie1.description).to be_truthy
    expect(movie1.imdb_id).to be_truthy
    expect(movie1.trailer).to be_truthy
    expect(movie1.rated).to be_truthy
    expect(movie1.genre).to be_truthy
    expect(movie1.imdb).to be_truthy
    expect(movie1.metacritic).to be_truthy
    expect(movie1.rotten).to be_truthy if movie1.rotten


    expect(movie2.id).to be_truthy
    expect(movie2.title).to be_truthy
    expect(movie2.year).to be_truthy
    expect(movie2.rating).to be_truthy
    expect(movie2.poster).to be_truthy
    expect(movie2.description).to be_truthy
    expect(movie2.imdb_id).to be_truthy
    # expect(movie2.trailer).to be_truthy
    expect(movie2.rated).to be_truthy
    expect(movie2.genre).to be_truthy
    expect(movie2.imdb).to be_truthy
    expect(movie2.metacritic).to be_truthy
    expect(movie2.rotten).to be_truthy if movie2.rotten
  end

  it "creates base characteristics of a movie from worst" do 
    @results.worst_acted("brad pitt")
    movie1 = Movie.all[-1]
    movie2 = Movie.all[-2]

    expect(movie1).to_not equal(movie2)

    expect(movie1.id).to be_truthy
    expect(movie1.title).to be_truthy
    expect(movie1.year).to be_truthy
    expect(movie1.rating).to be_truthy
    expect(movie1.poster).to be_truthy
    expect(movie1.description).to be_truthy
    expect(movie1.imdb_id).to be_truthy
    expect(movie1.trailer).to be_truthy
    expect(movie1.rated).to be_truthy
    expect(movie1.genre).to be_truthy
    expect(movie1.imdb).to be_truthy
    expect(movie1.metacritic).to be_truthy
    expect(movie1.rotten).to be_truthy if movie1.rotten


    expect(movie2.id).to be_truthy
    expect(movie2.title).to be_truthy
    expect(movie2.year).to be_truthy
    expect(movie2.rating).to be_truthy
    expect(movie2.poster).to be_truthy
    expect(movie2.description).to be_truthy
    expect(movie2.imdb_id).to be_truthy
    # expect(movie2.trailer).to be_truthy
    expect(movie2.rated).to be_truthy
    expect(movie2.genre).to be_truthy
    expect(movie2.imdb).to be_truthy
    expect(movie2.metacritic).to be_truthy
    expect(movie2.rotten).to be_truthy if movie2.rotten
  end

  it "creates best directed movie list" do 
    best = @results.best_directed("george lucas")
    expect(best[0][:imdb].to_f >= best[1][:imdb].to_f).to eq(true)
    expect(best[-2][:imdb].to_f >= best[-1][:imdb].to_f).to eq(true)
  end

  it "creates worst direced movie list" do 
    best = @results.worst_directed("george lucas")
    expect(best[0][:imdb].to_f <= best[1][:imdb].to_f).to eq(true)
    expect(best[-2][:imdb].to_f <= best[-1][:imdb].to_f).to eq(true)
  end

end