FactoryBot.define do
  factory :menu do
    sequence(:date) { |n| Date.today + n.days }  # 連続した日付を生成する

    association :user
    association :dish
  end
end
