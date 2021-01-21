require 'rails_helper'

describe 'CRUD functionality on comments' do 
  before :each do 
    @user = create(:user)
    @movie = create(:movie)
    user_movie = create(:user_movie, user: @user, movie: @movie)

    OmniAuth.config.test_mode = true

    OmniAuth.config.mock_auth[:google_oauth2] = OmniAuth::AuthHash.new({
      :provider => 'google_oauth',
      :info => {
        name: @user.name,
        email: @user.email,
        image: @user.photo
      },
      :credentials => {
        token: @user.google_token
      }
    })

    visit '/'
    within('.main_menu') do
      click_link 'Log In with Google'
    end
    expect(page).to have_content("Logged in as #{@user.name}")
    expect(current_path).to eq profile_path
    expect(User.count).to eq(1)
  end

  it "Posts and deltes a comment" do 
    visit '/profile'
    expect(@movie.title).to eq('Movie Title')
    expect(@movie.users[0].name).to eq('MyString')
    expect(@user.movies[0].title).to eq('Movie Title')
    within(".movie-#{@movie.id}-new-comment-content") do 
        fill_in :comment, with: "Test Comment"
    end
    within(".movie-#{@movie.id}-new-comment-submit") do 
        click_button "Comment"
    end

    expect(current_path).to eq('/profile')
    expect(page).to have_content("Test Comment")

    within(".movie-#{@movie.id}-comments") do
      within(".actions") do 
        click_button "Delete"
      end
    end

    expect(current_path).to eq('/profile')
    expect(page).to_not have_content("Test Comment")
  end
end