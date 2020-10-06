require 'rails_helper'

describe "Create movie objects from API call" do

  before :each do 
    @results = MovieResults.new
  end

  it "creates base characteristics of a movie from best" do 
    @results.best_by("brad pitt")
    first_movie = Movie.first 
    last_movie = Movie.last 

    expect(first_movie).to_not equal(last_movie)

    expect(first_movie.id).to be_truthy
    expect(first_movie.title).to be_truthy
    expect(first_movie.year).to be_truthy
    expect(first_movie.rating).to be_truthy
    expect(first_movie.poster).to be_truthy
    expect(first_movie.description).to be_truthy

    expect(last_movie.id).to be_truthy
    expect(last_movie.title).to be_truthy
    expect(last_movie.year).to be_truthy
    expect(last_movie.rating).to be_truthy
    expect(last_movie.poster).to be_truthy
    expect(last_movie.description).to be_truthy
  end

  it "creates base characteristics of a movie from worst" do 
    @results.worst_by("brad pitt")
    first_movie = Movie.first 
    last_movie = Movie.last 

    expect(first_movie).to_not equal(last_movie)

    expect(first_movie.id).to be_truthy
    expect(first_movie.title).to be_truthy
    expect(first_movie.year).to be_truthy
    expect(first_movie.rating).to be_truthy
    expect(first_movie.poster).to be_truthy
    expect(first_movie.description).to be_truthy

    expect(last_movie.id).to be_truthy
    expect(last_movie.title).to be_truthy
    expect(last_movie.year).to be_truthy
    expect(last_movie.rating).to be_truthy
    expect(last_movie.poster).to be_truthy
    expect(last_movie.description).to be_truthy
  end

end