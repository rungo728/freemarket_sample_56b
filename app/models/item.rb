class Item < ApplicationRecord
  # 購入者と出品者を分けるアソシエーション
  belongs_to :saler, class_name: "User"
  belongs_to :buyer, class_name: "User"

  belongs_to :prefecture
  belongs_to :category
  has_many :photos, dependent: :destroy

  validates_associated :prefecture, :category

  # 画像と同時に投稿するための記述
  accepts_nested_attributes_for :photos, allow_destroy: true

  # バリデーションの記述
  validates :name, presence: true,length: { maximum: 40 }

  validates :description, length: { maximum: 1000 } ,presence: true

  validates :category, presence: true

  validates :status, presence: true

  validates :shipping_charge, presence: true

  validates :prefecture, presence: true

  validates :days_before_shipment, presence: true

  validates :price,numericality:{ greater_than: 299, less_than: 10000000}, presence: true

  enum prefecture: {

    北海道:0,青森県:1,岩手県:2,宮城県:3,秋田県:4,山形県:5,福島県:6,茨城県:7,栃木県:8,群馬県:9,埼玉県:10,千葉県:11,東京都:12,神奈川県:13,新潟県:14,富山県:15,石川県:16,福井県:17,山梨県:18,長野県:19,岐阜県:20,静岡県:21,愛知県:22,三重県:23,滋賀県:24,京都府:25,大阪府:26,兵庫県:27,奈良県:28,和歌山県:29,鳥取県:30,島根県:31,岡山県:32,広島県:33,山口県:34,徳島県:35,香川県:36,愛媛県:37,高知県:38,福岡県:39,佐賀県:40,長崎県:41,熊本県:42,大分県:43,宮崎県:44,鹿児島県:45,沖縄県:46

  }

  enum category: {
    レディース:1, メンズ:2, ベビー・キッズ:3, インテリア・住まい・小物:4, 本・音楽・ゲーム:5, おもちゃ・ホビー・グッズ:6, コスメ・香水・美容:7, 家電・スマホ・カメラ:8, スポーツ・レジャー:9, ハンドメイド:10, チケット:11, 自転車・オートバイ:12
  }

  enum status: {
    新品、未使用:1, 未使用に近い:2, 目立った傷や汚れなし:3, やや傷や汚れあり:4, 傷や汚れあり:5, 全体的に状態が悪い:6
  }
  # enum status: {displayed: 0, shipped: 1, received: 2 ,trading: 3, stopped: 4}

    scope :be_sold, -> { where.not(buyer_id: nil) }

    scope :be_bought, -> (user_id) { where("buyer_id = ?", user_id) }

    scope :be_indexed, ->{ where.not(status: :stopped).where.not(status: :received) }


  
  def previous
    Item.order('created_at desc, id desc').where('created_at <= ? and id < ?', created_at, id).first
  end

  def next
    Item.order('created_at desc, id desc').where('created_at >= ? and id > ?', created_at, id).reverse.first
  end
end
