class City < ApplicationRecord
  belongs_to :area, foreign_key: :area_id

  validates :name, presence: true
end