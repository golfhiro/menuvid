FactoryBot.define do
  factory :GenreTag do
    name { "和食" }
    association :dish
  end
end
