require 'rails_helper'

RSpec.describe Price, type: :model do
  let!(:area1) { create(:area, price: 1, area: 1) }
  let!(:area2) { create(:area, price: 2, area: 2) }

  let!(:city1) { create(:city, area: area1) }
  let!(:city2) { create(:city, area: area2) }

  context '.calculate' do
    it 'should calculate the price for two cities with dimensions' do
      expect(Price.calculate(
        cities: { depart_city: city1, delivery_city: city2 }, weight: 10, length: 10, width: 50, height: 100)
      ).to eq 20
    end
  end
end