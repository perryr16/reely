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
    expect(movies[:total_results]).to eq(85)
  end
  
  it 'returns best movies by actor name' do 
    movies = @service.get_best_by_actor('brad pitt')
    expect(movies[:total_results]).to eq(85)
  end

  it 'returns worst movies by actor id' do 
    movies = @service.get_worst_by_actor_id(287)
    expect(movies[:total_results]).to eq(65)
  end

  it 'returns worst movies by actor name' do 
    movies = @service.get_worst_by_actor('brad pitt')
    expect(movies[:total_results]).to eq(65)
  end
end