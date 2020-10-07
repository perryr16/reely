require 'rails_helper'

RSpec.describe Director, type: :model do
  it {should have_many :movie_directors}
  it {should have_many(:movies).through(:movie_directors)}
end
