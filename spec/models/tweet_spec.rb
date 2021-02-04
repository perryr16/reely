require 'rails_helper'

RSpec.describe Tweet, type: :model do
  it {should belong_to :twitter_users}
  it {should belong_to :movies}
end
