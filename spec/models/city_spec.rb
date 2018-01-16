require 'rails_helper'

RSpec.describe City, type: :model do
  it { should belong_to :area }
  it { should validate_presence_of :name }

  let!(:area1) { create(:area, price: 1, area: 1) }
  let!(:area2) { create(:area, price: 2, area: 2) }

  let!(:city1) { create(:city, area: area1) }
  let!(:city2) { create(:city, area: area2) }

  context '.max_area' do
    it 'should return the max area_id from two cities' do
      expect(City.max_area(city1, city2)).to eq 2
    end
  end
end