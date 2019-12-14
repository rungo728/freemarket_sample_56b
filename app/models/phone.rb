class Phone < ApplicationRecord
  belongs_to :user

  # フォーマット定義
  VALID_PHONE_NUMBER_REGEX = /\A\d{10,11}\z/

  # バリデーション
  validates :phone_number, presence: true, length:{ in: 10..11 }, format: { with: VALID_PHONE_NUMBER_REGEX }
end
