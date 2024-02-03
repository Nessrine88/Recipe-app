FactoryBot.define do
  factory :food do
    name { Faker::Food.dish }
    measurement_unit { 'kg' }
    price { Faker::Number.decimal(l_digits: 2) }
  end
end
