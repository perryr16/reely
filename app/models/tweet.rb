class Tweet < ApplicationRecord
  belongs_to :twitter_user
  belongs_to :movie
end
