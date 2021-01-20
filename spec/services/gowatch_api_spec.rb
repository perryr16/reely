require 'rails_helper'

describe 'GoWatch service returns steaming data for a movie' do 
  it "returns fightclub given id" do
    service = GoWatchService.new
    fight_club_id = "tt0137523"
    results = service.get_streaming_data(fight_club_id)
    binding.pry
    # expect(results[:Year]).to be_truthy
    # expect(results[:Rated]).to be_truthy
    # expect(results[:Genre]).to be_truthy
    # expect(results[:Actors]).to be_truthy
    # expect(results[:Director]).to be_truthy
    # expect(results[:Ratings].length).to eq(3)
  end
  
end