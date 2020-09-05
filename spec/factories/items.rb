FactoryBot.define do
  factory :item do
    association :user
    name               { Faker::Lorem.sentence }
    explanation        { Faker::Lorem.sentence }
    price              { 1000 }
    category_id        { '2' }
    status_id          { '2' }
    delivery_fee_id    { '2' }
    delivery_day_id    { '2' }
    shipping_origin_id { '2' }
  end
end
