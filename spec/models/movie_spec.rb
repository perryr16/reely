require 'rails_helper'

RSpec.describe Movie, type: :model do
  it {should have_many :movie_people}
  it {should have_many(:people).through(:movie_people)}
end
