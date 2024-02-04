# spec/factories/recipe_foods.rb
FactoryBot.define do
    factory :recipe_food do
      quantity { Faker::Number.between(from: 1, to: 10) }
    end
  end
  