class Personal < ApplicationRecord
  belongs_to :user
  belongs_to :prefecture, optional: true

  # フォーマット定義
  VALID_LAST_NAME_REGEX       = /\A[ぁ-んァ-ン一-龥]/
  VALID_FIRST_NAME_REGEX      = /\A[ぁ-んァ-ン一-龥]/
  VALID_LAST_NAME_KANA_REGEX  = /\A[ァ-ヶー－]+\z/
  VALID_FIRST_NAME_KANA_REGEX = /\A[ァ-ヶー－]+\z/

  # バリデーション
  validates :last_name, presence: true, length:{ maximum: 30}, format: { with: VALID_LAST_NAME_REGEX }
  validates :first_name, presence: true, length:{ maximum: 30}, format: { with: VALID_FIRST_NAME_REGEX }
  validates :last_name_kana, presence: true, length:{ maximum: 30}, format: { with: VALID_LAST_NAME_KANA_REGEX }
  validates :first_name_kana, presence: true, length:{ maximum: 30}, format: { with: VALID_FIRST_NAME_KANA_REGEX }
  validates :birthday, presence: true
end
