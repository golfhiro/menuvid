FactoryBot.define do
  factory :video do
    video_id { 'BNcDvCHwfR4' }
    title { '【150万回再生人気レシピ】ご飯がすすむ！3つのポイントで格段に柔らかくジューシーな味わいに！絶品しょうが焼きの作り方' }
    thumbnail { 'https://i.ytimg.com/vi/BNcDvCHwfR4/hqdefault.jpg' }
    association :dish
  end
end
