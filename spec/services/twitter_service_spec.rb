require 'rails_helper'

describe 'hit the movie database api' do 
  before :each do 
    @service = TwitterService.new
  end

  it 'returns tweets by query' do 
    body = @service.get_tweets("True Romance")
    expect(body[:data]).to be_truthy
    expect(body[:data].length).to eq(10)
    
    tweets = body[:data]
    expect(tweets[0][:id]).to be_truthy
    expect(tweets[0][:text]).to be_truthy
    expect(tweets[-1][:id]).to be_truthy
    expect(tweets[-1][:text]).to be_truthy

  end

  # it 'returns an actor id' do 
  #   # brad_json = @service.get_actor_id
  #   brad_id = @service.get_actor_id('brad pitt')
  #   expect(brad_id).to eq(287)
  # end

  # it 'returns best movies by actor id' do 
  #   movies = @service.get_all_by_actor_id(287)
  #   expect(movies[:cast][0][:id]).to be_truthy
  #   expect(movies[:cast][0][:title]).to be_truthy
  #   expect(movies[:cast][0][:release_date]).to be_truthy
  #   expect(movies[:cast][0][:vote_average]).to be_truthy
  #   expect(movies[:cast][0][:vote_count]).to be_truthy
  #   expect(movies[:cast][0][:poster_path]).to be_truthy
  #   expect(movies[:cast][0][:overview]).to be_truthy
  #   expect(movies[:cast][-1][:id]).to be_truthy
  #   expect(movies[:cast][-1][:title]).to be_truthy
  #   expect(movies[:cast][-1][:release_date]).to be_truthy
  #   expect(movies[:cast][-1][:vote_average]).to be_truthy
  #   expect(movies[:cast][-1][:vote_count]).to be_truthy
  #   expect(movies[:cast][-1][:poster_path]).to be_truthy
  #   expect(movies[:cast][-1][:overview]).to be_truthy
  # end

  # it 'returns all movies by actor name' do 
  #   movies = @service.get_all_by_actor('brad pitt')
  #   expect(movies[0][:id]).to be_truthy
  #   expect(movies[0][:title]).to be_truthy
  #   expect(movies[0][:release_date]).to be_truthy
  #   expect(movies[0][:vote_average]).to be_truthy
  #   expect(movies[0][:vote_count]).to be_truthy
  #   expect(movies[0][:poster_path]).to be_truthy
  #   expect(movies[0][:overview]).to be_truthy
  #   expect(movies[-1][:id]).to be_truthy
  #   expect(movies[-1][:title]).to be_truthy
  #   expect(movies[-1][:release_date]).to be_truthy
  #   expect(movies[-1][:vote_average]).to be_truthy
  #   expect(movies[-1][:vote_count]).to be_truthy
  #   expect(movies[-1][:poster_path]).to be_truthy
  #   expect(movies[-1][:overview]).to be_truthy
  # end

  # it "returns all movies by a director" do 
  #   movies = @service.get_all_by_director('george lucas')
  #   expect(movies.length).to eq(18)
  #   expect(movies[0][:job]).to eq("Director")
  #   expect(movies[-1][:job]).to eq("Director")
  # end
end