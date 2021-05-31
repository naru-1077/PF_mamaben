FactoryBot.define do
  factory :genre do
    genre_name { Faker::Lorem.characters(number: 15) }
  end
end