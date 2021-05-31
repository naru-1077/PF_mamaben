FactoryBot.define do
  factory :recipe do
    recipe { Faker::Lorem.characters(number: 50) }
  end
end