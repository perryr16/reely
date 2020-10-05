require 'rails_helper'

RSpec.describe MoviePerson, type: :model do
  it {should belong_to :movie}
  it {should belong_to :person}
end
