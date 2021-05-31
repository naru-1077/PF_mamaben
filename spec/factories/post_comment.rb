FactoryBot.define do
  factory :post_comment do
    comment { Faker::Lorem.characters(number: 80) }
  end
end