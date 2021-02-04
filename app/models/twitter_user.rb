class TwitterUser < ApplicationRecord
  validate_uniqueness_of :username
  has_many :tweets
end
