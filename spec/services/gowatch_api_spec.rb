require 'rails_helper'

describe 'GoWatch service returns steaming data for a movie' do 
  it "returns fightclub given id" do
    service = GoWatchService.new
    fight_club_id = "tt0137523"
    results = service.get_streaming_data(fight_club_id)
    expect(results[:name]).to be_truthy
    expect(results[:offers]).to be_truthy
    expect(results[:offers][0][:provider]).to be_truthy
    expect(results[:offers][0][:price]).to be_truthy
    expect(results[:offers][0][:url]).to be_truthy
  end
  
end