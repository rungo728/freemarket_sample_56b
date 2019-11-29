class Address < ApplicationRecord
  belongs_to :user
  belongs_to :prefecture, optional: true

  validates :postcode, presence: true, length:{ minimum: 7, maximum: 8 }
  validates :prefecture_id, presence: true,length:{ in: 0..46 }
  validates :city, presence: true, length:{ maximum: 30 }
  validates :address, presence: true, length:{ maximum: 30}
  validates :building, length:{ maximum: 30 }
  validates :last_name, presence: true, length:{ maximum: 30}
  validates :first_name, presence: true, length:{ maximum: 30}
  validates :last_name_kana, presence: true, length:{ maximum: 30}
  validates :first_name_kana, presence: true, length:{ maximum: 30}
  validates :phone_number_sub, length:{ minimum: 10, maximum: 13 }
end
