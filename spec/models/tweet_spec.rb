require 'rails_helper'

RSpec.describe Tweet, type: :model do
  it {should belong_to :movie}
  it {should belong_to :twitter_user}
end
