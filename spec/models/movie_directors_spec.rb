require 'rails_helper'

RSpec.describe MovieDirector, type: :model do
  it {should belong_to :movie}
  it {should belong_to :director}
end
