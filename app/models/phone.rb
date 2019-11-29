class Phone < ApplicationRecord
  belongs_to :user

  validates :phone_number, presence: true, length:{ minimum: 10, maximum: 13 }
end
