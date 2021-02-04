require 'rails_helper'

xdescribe "Streaming Data" do 
  it "profile movies show has details" do 
    @user = create(:user)
    @movie = create(:movie, imdb_id: "tt0137523")
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

    click "Streaming Options"

  end
  
  xit "dbless show has details" do 
    
  end
end