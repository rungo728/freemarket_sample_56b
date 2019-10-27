class Item < ApplicationRecord
  # 購入者と出品者を分けるアソシエーション
  belongs_to :saler, class_name: "User"
  belongs_to :buyer, class_name: "User"

  belongs_to :prefecture
  belongs_to :category
  belongs_to :brand
  has_many :comments
  has_many :photos
end
