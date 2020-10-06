require 'rails_helper'

describe 'hit the movie database api' do 
  before :each do 
    @service = TmdbService.new
  end

  it 'returns an actor id' do 
    # brad_json = @service.get_actor_id
    brad_id = @service.get_actor_id('brad pitt')
    expect(brad_id).to eq(287)
  end

  it 'returns best movies by actor id' do 
    movies = @service.get_best_by_actor_id(287)
    # movie_data = []
    # movies[:results].each do |movie|
    #   movie_hash = {}
    #   movie_hash[:title] = movie[:title]
    #   movie_hash[:vote_count] = movie[:vote_count] 
    #   movie_hash[:vote_average] = movie[:vote_average] 
    #   movie_hash[:overview] = movie[:overview]
    #   movie_data << movie_hash
    # end
    expect(movies[:total_results]).to eq(65)
    expect(movies[:results][0][:id]).to be_truthy
    expect(movies[:results][0][:title]).to be_truthy
    expect(movies[:results][0][:release_date]).to be_truthy
    expect(movies[:results][0][:vote_average]).to be_truthy
    expect(movies[:results][0][:vote_count]).to be_truthy
    expect(movies[:results][0][:poster_path]).to be_truthy
    expect(movies[:results][0][:overview]).to be_truthy
  end
  
  it 'returns best movies by actor name' do 
    movies = @service.get_best_by_actor('brad pitt')
    expect(movies[:total_results]).to eq(65)
    expect(movies[:results][0][:id]).to be_truthy
    expect(movies[:results][0][:title]).to be_truthy
    expect(movies[:results][0][:release_date]).to be_truthy
    expect(movies[:results][0][:vote_average]).to be_truthy
    expect(movies[:results][0][:vote_count]).to be_truthy
    expect(movies[:results][0][:poster_path]).to be_truthy
    expect(movies[:results][0][:overview]).to be_truthy
  end

  it 'returns worst movies by actor id' do 
    movies = @service.get_worst_by_actor_id(287)
    expect(movies[:total_results]).to eq(65)
    expect(movies[:results][0][:id]).to be_truthy
    expect(movies[:results][0][:title]).to be_truthy
    expect(movies[:results][0][:release_date]).to be_truthy
    expect(movies[:results][0][:vote_average]).to be_truthy
    expect(movies[:results][0][:vote_count]).to be_truthy
    expect(movies[:results][0][:poster_path]).to be_truthy
    expect(movies[:results][0][:overview]).to be_truthy
  end

  it 'returns worst movies by actor name' do 
    movies = @service.get_worst_by_actor('brad pitt')
    expect(movies[:total_results]).to eq(65)
    expect(movies[:results][0][:id]).to be_truthy
    expect(movies[:results][0][:title]).to be_truthy
    expect(movies[:results][0][:release_date]).to be_truthy
    expect(movies[:results][0][:vote_average]).to be_truthy
    expect(movies[:results][0][:vote_count]).to be_truthy
    expect(movies[:results][0][:poster_path]).to be_truthy
    expect(movies[:results][0][:overview]).to be_truthy
  end
end