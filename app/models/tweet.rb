class Tweet < ApplicationRecord
  belongs_to :twitter_users
  belongs_to :movies
end
