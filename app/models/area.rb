class Area < ApplicationRecord
  has_many :cities

  validates :area, :price, presence: true
end