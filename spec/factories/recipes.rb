FactoryBot.define do
  factory :recipe do
    name { Faker::Food.dish }
    preparation_time { Faker::Number.decimal(l_digits: 1, r_digits: 2) }
    cooking_time { Faker::Number.decimal(l_digits: 1, r_digits: 2) }
    description { Faker::Lorem.paragraph }
    public { true }
    user
  end
end
