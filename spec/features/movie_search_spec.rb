require 'rails_helper'

describe 'best results by actor' do 
  
  it 'searches correctly' do 
    visit '/'
    within('.actor-search') do 
      choose 'search_type_best'
      fill_in :search, with: "Brad Pitt"
      click_button "Search"
    end
    expect(current_path).to eq("/best_movie_search")
  end
end