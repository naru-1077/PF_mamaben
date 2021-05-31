FactoryBot.define do
  factory :post do
    title { Faker::Lorem.characters(number: 20) }
    introduction { Faker::Lorem.characters(number: 50) }
    material { Faker::Lorem.characters(number: 50) }
  end
end