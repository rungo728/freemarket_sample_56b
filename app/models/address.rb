class Address < ApplicationRecord
  belongs_to :user
  belongs_to :prefecture, optional: true

  # フォーマット定義
  VALID_LAST_NAME_REGEX        = /\A[ぁ-んァ-ン一-龥]/
  VALID_FIRST_NAME_REGEX       = /\A[ぁ-んァ-ン一-龥]/
  VALID_LAST_NAME_KANA_REGEX   = /\A[ァ-ヶー－]+\z/
  VALID_FIRST_NAME_KANA_REGEX  = /\A[ァ-ヶー－]+\z/
  VALID_POSTCODE_REGEX         = /\A\d{3}[-]\d{4}$|^\d{7}\z/
  VALID_PHONE_NUMBER_SUB_REGEX = /\A\d{10,11}\z/

  # バリデーション
  validates :last_name, presence: true, length:{ maximum: 30}, format: { with: VALID_LAST_NAME_REGEX }
  validates :first_name, presence: true, length:{ maximum: 30}, format: { with: VALID_FIRST_NAME_REGEX }
  validates :last_name_kana, presence: true, length:{ maximum: 30}, format: { with: VALID_LAST_NAME_KANA_REGEX }
  validates :first_name_kana, presence: true, length:{ maximum: 30}, format: { with: VALID_FIRST_NAME_KANA_REGEX }
  validates :postcode, presence: true, length:{ minimum: 7, maximum: 8 }, format: { with: VALID_POSTCODE_REGEX }
  validates :prefecture_id, presence: true
  validates :city, presence: true, length:{ maximum: 30 }
  validates :address, presence: true, length:{ maximum: 30}
  validates :building, length:{ maximum: 30 }, allow_blank: true
  validates :phone_number_sub, length:{ in: 10..11 }, format: { with: VALID_PHONE_NUMBER_SUB_REGEX }, allow_blank: true
end
