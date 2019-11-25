class Prefecture < ApplicationRecord
  has_many :users
  has_many :items
  has_many :personal
  has_many :address
end
