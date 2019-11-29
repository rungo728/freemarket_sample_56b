class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # 買った商品、現在売っている商品、すでに売れた商品の条件付きアソシエーション
  has_many :buyed_items, foreign_key: "buyer_id", class_name: "Item"
  has_many :saling_items, -> { where("buyer_id is NULL") }, foreign_key: "saler_id", class_name: "Item"
  has_many :sold_items, -> { where("buyer_id is not NULL") }, foreign_key: "saler_id", class_name: "Item"

  belongs_to :prefecture
  has_many :evaluations
  has_many :cards

  has_one :personal
  accepts_nested_attributes_for :personal
  
  belongs_to :phone
  has_one :address
  accepts_nested_attributes_for :address

  # registration入力項目
  validates :nickname, presence: true, length:{ maximum: 10 }
  validates :email, presence: true, length:{ maximum: 254 }
  validates :password, presence: true, length:{ minimum: 7, maximum: 128 }
end