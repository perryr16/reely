FactoryBot.define do
  factory :movie do
    title { "Movie Title" }
    year { 1 }
    rating { 1.5 }
    imdb { "9" }
    rotten { "90" }
    metacritic { "88" }
    trailer { "www.trailer.com" }
    poster { "www.poster.com" }
    description { "it's a movie" }
  end
end
