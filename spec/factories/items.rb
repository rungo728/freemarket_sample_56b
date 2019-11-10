FactoryBot.define do
  factory :item do
    name {"商品"}
    description {"説明"}
    status {"普通"}
    size {"M"}
    shipping_charge {"なし"}
    shipping_method {"メルカリ便"}
    days_before_shipment {"1-2日"}
    price {"1000"}
    saler_id {1}
    buyer_id {2}
    prefecture
    category
    brand 
    created_at { Faker::Time.between(from: DateTime.now - 2, to: DateTime.now) }
  end
end