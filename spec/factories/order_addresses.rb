FactoryBot.define do
  factory :order_address do
    association :user
    association :item
    postal_code { '112-0004' }
    prefecture_id { 2 }
    city { '文京区' }
    house_number { '後楽１丁目' }
    building_name { '東京ドーム' }
    tell { '08012345678' }
    token { Faker::Internet.password(min_length: 15) }
  end
end
