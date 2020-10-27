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
    expect(current_path).to eq("/dbless_search")
  end
  
  xit 'searches correctly - actor worst' do 
    visit '/'
    within('.movie-search') do 
      select "Actor's"
      select "Worst"
      fill_in :search, with: "Brad Pitt"
      click_button "Search"
    end
    expect(current_path).to eq("/dblrd_search")
  end

  it 'searches incorrectly -  actor worst' do 
    visit '/'
    within('.movie-search') do 
      select "Actor's"
      select "Worst"
      fill_in :search, with: "adfadf"
      click_button "Search"
    end
    expect(current_path).to eq("/dbless_search")
    expect(page).to have_content("No Search Results Found")
  end
end