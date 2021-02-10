require 'rails_helper'

describe 'movie search by title' do  
 it 'show dbless movie is functional' do 
    visit '/dbless_search'
    within('.movie-search') do 
      select "Actor's"
      select "Worst"
      fill_in :search, with: "quentin tarantino"
      click_button "Search"
    end
    expect(current_path).to eq("/dbless_search")
    find('#movie-2').click
    movie = Movie.last
    expect(current_path).to eq("/movies/#{movie.id}")

  end
end