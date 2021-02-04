require 'rails_helper'

RSpec.describe TwitterUser, type: :model do
  it { should validate_uniqueness_of(:username) }
  it { should have_many :tweets }
end
