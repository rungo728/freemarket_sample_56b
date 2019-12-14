class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:facebook, :google_oauth2]

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

  # フォーマット定義
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  # registration入力項目
  validates :nickname, presence: true, length:{ maximum: 10 }
  validates :email, presence: true, length:{ maximum: 254 }, uniqueness: true, format: { with: VALID_EMAIL_REGEX }
  validates :password, presence: true, length:{ minimum: 7, maximum: 128 }
  validates :provider, length:{ in: 8..13 }, allow_blank: true
  validates :uid, length:{ in: 15..21}, allow_blank: true

  # omniauthのコールバック時に呼ばれるメソッド
  def self.from_omniauth(access_token)
    data = access_token.info

    # access_tokenのemailがusersテーブルに登録済みか確認する
    user = User.where(email: data['email']).first

    unless user
      # access_tokenのrmailが登録されていない場合
      # ソーシャルアカウントから取得したneme、email、passwordをuser変数に格納する
      user = User.new(
        nickname: data['name'],
        email: data['email'],
        password: Devise.friendly_token[0,20],
        provider: access_token.provider,
        uid: access_token.uid
      )
    end
    user
  end
end