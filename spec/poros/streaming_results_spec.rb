require 'rails_helper'

describe "results are formatted correctly" do 
  xit "returns data for fightclub" do 
    fight_club_id = "tt0137523"
    results = StreamingResults.new.streaming_data(fight_club_id)
    expect(results[0][:provider]).to be_truthy
    expect(results[0][:price]).to be_truthy
    expect(results[0][:url]).to be_truthy
    expect(results[-1][:provider]).to be_truthy
    expect(results[-1][:price]).to be_truthy
    expect(results[-1][:url]).to be_truthy

  end

end