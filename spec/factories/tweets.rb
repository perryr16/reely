FactoryBot.define do
  factory :tweet do
    tweet_id { "MyString" }
    text { "MyString" }
    twitter_user { nil }
    movie { nil }
  end
end
