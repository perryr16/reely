FactoryBot.define do
  factory :user do
    name { "MyString" }
    google_token { "MyString" }
    google_refresh_token { "MyString" }
    photo { "https://servniagara.org/wp-content/uploads/2018/04/profile-anonymous.jpg" }
  end
end
