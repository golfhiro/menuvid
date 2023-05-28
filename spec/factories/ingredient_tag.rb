FactoryBot.define do
  factory :IngredientTag do
    name { "肉" }
    association :dish
  end
end
