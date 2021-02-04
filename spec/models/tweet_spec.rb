require 'rails_helper'

RSpec.describe Tweet, type: :model do
  it {should belong_to :twitter_user}
  it {should belong_to :movie}
end
