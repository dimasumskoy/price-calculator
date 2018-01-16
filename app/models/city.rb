class City < ApplicationRecord
  belongs_to :area, foreign_key: :area_id

  validates :name, presence: true

  def self.max_area(depart_city_id, delivery_city_id)
    where(id: [depart_city_id, delivery_city_id]).maximum(:area_id)
  end
end