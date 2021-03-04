FactoryBot.define do
  factory :form_object do
    post_code       {'123-4567'}
    prefecture_id   { 2 }
    city            {'横浜市'}
    address         {'青山1-1-1'}
    phone_number    {'0901234567'}
    building_name   {'ビル'}
    token           {"tok_abcdefghijk00000000000000000"}
  end
end