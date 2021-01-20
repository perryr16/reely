FactoryBot.define do
  factory :comment do
    user { nil }
    movie { nil }
    comment { "MyString" }
    image_url { "MyString" }
  end
end
