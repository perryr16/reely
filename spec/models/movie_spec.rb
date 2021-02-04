require 'rails_helper'

RSpec.describe Movie, type: :model do
  it {should have_many :movie_actors}
  it {should have_many(:actors).through(:movie_actors)}
  it {should have_many :movie_directors}
  it {should have_many(:directors).through(:movie_directors)}
  it {should have_many :user_movies}
  it {should have_many(:users).through(:user_movies)}
  it {should have_many :comments}
  it {should have_many :tweets}
end
