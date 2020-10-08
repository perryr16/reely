require 'rails_helper'

describe "splash page" do 
  it "has a search field for best movies by actor" do 
    visit '/'
    within('.movie-search') do 
      select "Actor's"
      select "Best"
      fill_in :search, with: "Brad Pitt"
      click_button "Search"
    end
    expect(current_path).to eq("/movie_search")
  end
  
  it 'searches correctly actor worst' do 
    visit '/'
    within('.movie-search') do 
      select "Actor's"
      select "Worst"
      fill_in :search, with: "Brad Pitt"
      click_button "Search"
    end
    expect(current_path).to eq("/movie_search")
  end
end