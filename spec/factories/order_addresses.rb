FactoryBot.define do
  factory :order_address do
    postal_code { '333-3333' }
    prefecture_id { Faker::Number.within(range: 2..48) }
    city { '岡崎市' }
    address { Faker::Address.zip }
    building_name { 'テストビル１階' }
    phone_number { Faker::Number.number(digits: 11) }
    token { Faker::String.random }
    user_id { Faker::Number.within(range: 2..5) }
    item_id { Faker::Number.within(range: 5..10) }

  end
end
