require 'rails_helper'

RSpec.describe TwitterUser, type: :model do
  it {should have_many :tweets}
end
