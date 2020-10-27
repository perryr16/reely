require 'rails_helper'

RSpec.describe User, type: :model do
  it {should have_many :user_movies}
  it {should have_many(:movies).through(:user_movies)}
end
