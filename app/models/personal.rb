class Personal < ApplicationRecord
  belongs_to :user
  belongs_to :prefecture, optional: true

  validates :last_name, presence: true, length:{ maximum: 30}
  validates :first_name, presence: true, length:{ maximum: 30}
  validates :last_name_kana, presence: true, length:{ maximum: 30}
  validates :first_name_kana, presence: true, length:{ maximum: 30}
  validates :birthday, presence: true
end
