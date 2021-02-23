FactoryBot.define do
  factory :item do
    name            {'商品'}
    description     {'商品説明'}
    category_id     { 2 }
    condition_id    { 2 }
    delivery_id     { 2 }
    prefecture_id   { 2 }
    day_id          { 2 }
    price           { 10000 }

    after(:build) do |item|
      item.image.attach(io: File.open('public/test_image.png'), filename: 'test_image.png')
    end
  end
end
