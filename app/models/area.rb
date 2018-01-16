class Area < ApplicationRecord
  self.primary_key = :area

  has_many :cities, dependent: :destroy

  validates :area, :price, presence: true
end