require 'rails_helper'

RSpec.describe Person, type: :model do
  it {should have_many :movie_people}
  it {should have_many(:movies).through(:movie_people)}
end
