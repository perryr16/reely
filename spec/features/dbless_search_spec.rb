require 'rails_helper'

describe 'movie search by title' do 
  
  it 'searches correctly by title' do 
    visit '/dbless_search'
    within('.movie-search') do 
      select "Title"
      fill_in :search, with: "The Shining"
      click_button "Search"
    end
    expect(current_path).to eq("/dbless_search")
   end

end