require 'rails_helper'

RSpec.describe PricesController, type: :controller do
  let!(:area1) { create(:area, price: 1, area: 1) }
  let!(:area2) { create(:area, price: 2, area: 2) }

  let!(:city1)   { create(:city, area: area1) }
  let!(:city2)   { create(:city, area: area2) }

  describe 'GET #new' do
    before { get :new }

    it 'renders #new action' do
      expect(response).to render_template :new
    end
  end

  describe 'GET #calculate' do
    before do
      get :calculate, params: {
        cities: { depart_city: city1, delivery_city: city2 },
        weight: 10, length: 10, width: 50, height: 100
      }
    end

    it 'assigns requested price to @price' do
      expect(assigns(:price)).to eq 30
    end

    it 'renders new template' do
      expect(response).to render_template :new
    end
  end
end
