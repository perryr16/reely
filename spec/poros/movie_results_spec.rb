require 'rails_helper'

describe "Create movie objects from API call" do

  before :each do 
    @results = MovieResults.new
  end

  it "creates base characteristics of a movie from best" do 
    @results.best_by("brad pitt")
    movie1 = Movie.all[-1]
    movie2 = Movie.all[-2]
    expect(movie1).to_not equal(movie2)
    binding.pry

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
    expect(movie1.cast).to be_truthy
    expect(movie1.director).to be_truthy

    expect(movie2.id).to be_truthy
    expect(movie2.title).to be_truthy
    expect(movie2.year).to be_truthy
    expect(movie2.rating).to be_truthy
    expect(movie2.poster).to be_truthy
    expect(movie2.description).to be_truthy
    expect(movie2.imdb_id).to be_truthy
    expect(movie2.trailer).to be_truthy
    expect(movie2.rated).to be_truthy
    expect(movie2.genre).to be_truthy
    expect(movie2.cast).to be_truthy
    expect(movie2.director).to be_truthy
  end

  it "creates base characteristics of a movie from worst" do 
    @results.worst_by("brad pitt")
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
    expect(movie1.cast).to be_truthy
    expect(movie1.director).to be_truthy

    expect(movie2.id).to be_truthy
    expect(movie2.title).to be_truthy
    expect(movie2.year).to be_truthy
    expect(movie2.rating).to be_truthy
    expect(movie2.poster).to be_truthy
    expect(movie2.description).to be_truthy
    expect(movie2.imdb_id).to be_truthy
    expect(movie2.trailer).to be_truthy
    expect(movie2.rated).to be_truthy
    expect(movie2.genre).to be_truthy
    expect(movie2.cast).to be_truthy
    expect(movie2.director).to be_truthy
  end

end