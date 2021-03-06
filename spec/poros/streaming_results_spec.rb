require 'rails_helper'

xdescribe "Streaming results are formatted correctly" do 
  it "returns streaming data for fightclub" do 
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