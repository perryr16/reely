require 'rails_helper'

describe "splash page" do 
  it "has a search field for best movies by actor" do 
    visit '/'
    within('.actor-search') do 
      choose 'search_type_best'
      fill_in :search, with: "Brad Pitt"
      click_button "Search"
    end
    expect(current_path).to eq("/movie_search")
  end
end