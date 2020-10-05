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

  xit 'returns movies by actor id' do 
    brad_287 = @service.get_movies_by_actor_id(287)
    binding.pry

  end
  
  it 'returns movies by actor name' do 

  end
end