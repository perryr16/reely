class TwitterUser < ApplicationRecord
  validates_uniqueness_of :username
  has_many :tweets

  def self.create_twitter_users(twitter_users_data)
    twitter_users_data.each do |user|
      TwitterUser.create(
        username: user[:username],
        name: user[:name],
        profile_image_url: user[:profile_image_url],
        author_id: user[:id]
      )
    end
  end
end
