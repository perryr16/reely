require 'rails_helper'

describe "Create movie lists from API call" do

  before :each do 
    @results = DblessResults.new
  end
  
  it "returns relavent data for an actor" do 
    movie_list = @results.best_acted("brad pitt")
    movie1 = movie_list[0]
    movie2 = movie_list[1]
    expect(movie1).to_not equal(movie2)

    expect(movie1[:title]).to be_truthy
    expect(movie1[:year]).to be_truthy
    expect(movie1[:rating]).to be_truthy
    expect(movie1[:poster]).to be_truthy
    expect(movie1[:description]).to be_truthy
    expect(movie1[:imdb_id]).to be_truthy
    expect(movie1[:trailer]).to be_truthy
    expect(movie1[:rated]).to be_truthy
    expect(movie1[:genre]).to be_truthy
    expect(movie1[:imdb]).to be_truthy
    expect(movie1[:metacritic]).to be_truthy
    expect(movie1[:rotten]).to be_truthy if movie1[:rotten]


    expect(movie2[:title]).to be_truthy
    expect(movie2[:year]).to be_truthy
    expect(movie2[:rating]).to be_truthy
    expect(movie2[:poster]).to be_truthy
    expect(movie2[:description]).to be_truthy
    expect(movie2[:imdb_id]).to be_truthy
    expect(movie2[:trailer]).to be_truthy
    expect(movie2[:rated]).to be_truthy
    expect(movie2[:genre]).to be_truthy
    expect(movie2[:imdb]).to be_truthy
    expect(movie2[:metacritic]).to be_truthy
    expect(movie2[:rotten]).to be_truthy if movie2[:rotten]
  end
end