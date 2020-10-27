require 'rails_helper'

RSpec.describe UserMovie, type: :model do
  it {should belong_to :movie}
  it {should belong_to :user}
end
