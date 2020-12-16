require 'rails_helper'

describe 'best results by actor' do 
  before :each do 
    visit '/'
    within('.movie-search') do 
      select "Actor's"
      select "Best"
      fill_in :search, with: "Brad Pitt"
      click_button "Search"
    end
  end
  
  it 'searches correctly actor best' do 
    visit '/dbless_search'
    within('.movie-search') do 
      select "Actor's"
      select "Best"
      fill_in :search, with: "Brad Pitt"
      click_button "Search"
    end
    expect(current_path).to eq("/dbless_search")
  end
  it 'searches correctly actor worst' do 
    visit '/dbless_search'
    within('.movie-search') do 
      select "Actor's"
      select "Worst"
      fill_in :search, with: "Brad Pitt"
      click_button "Search"
    end
    expect(current_path).to eq("/dbless_search")
  end
end