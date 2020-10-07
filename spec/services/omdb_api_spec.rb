require 'rails_helper'

describe 'OMDB service hits OMDB api' do 
  it "returns fightclub given id" do
    service = OmdbService.new
    fight_club_id = "tt0137523"
    results = service.get_movie_data(fight_club_id)
    expect(results[:Year]).to be_truthy
    expect(results[:Rated]).to be_truthy
    expect(results[:Genre]).to be_truthy
    expect(results[:Actors]).to be_truthy
    expect(results[:Director]).to be_truthy
    expect(results[:Ratings].length).to eq(3)
  end
  
end