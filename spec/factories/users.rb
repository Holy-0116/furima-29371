FactoryBot.define do
  factory :user do
    nickname { 'test' }
    email { Faker::Internet.free_email }
    password { "test1234" }
    password_confirmation { password }
    name_first { '山田' }
    name_family { '太郎' }
    name_first_reading { 'ヤマダ' }
    name_family_reading { 'タロウ' }
    birthday { Faker::Date.birthday(min_age: 18) }
  end
end
