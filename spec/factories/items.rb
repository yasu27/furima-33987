FactoryBot.define do
  factory :item do
    name            {'商品'}
    description     {'商品説明'}
    category_id     {'レディース'}
    condition_id    {'新品、未使用'}
    delivery_id     {'着払い(購入者負担)'}
    prefecture_id   {'北海道'}
    day_id          {'1~2日で発送'}
    price           {'10000'}
  end
end
