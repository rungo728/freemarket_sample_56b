class Item < ApplicationRecord
  # 購入者と出品者を分けるアソシエーション
  belongs_to :saler, class_name: "User"
  belongs_to :buyer, class_name: "User"

  belongs_to :prefecture
  belongs_to :category
  has_many :comments
  has_many :photos

  
  def previous
    Item.order('created_at desc, id desc').where('created_at <= ? and id < ?', created_at, id).first
  end

  def next
    Item.order('created_at desc, id desc').where('created_at >= ? and id > ?', created_at, id).reverse.first
  end
end
