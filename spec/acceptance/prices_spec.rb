require 'rails_helper'

feature 'price calculation' do
  given(:area1) { Area.make(area: 1, price: 2) }
  given(:area2) { Area.make(area: 2, price: 3) }
  given(:depart_city)  { City.make(name: 'Москва', area_id: area1) }
  given(:arrival_city) { City.make(name: 'Санкт-Петербург', area_id: area2) }

  scenario 'user can calculate the price' do
    visit '/prices/calculate'

    select('Москва', from: :depart_city)
    select('Санкт-Петербург', from: :delivery_city)
    fill_in 'Вес', with: 10

    within('.dimensions') do
      fill_in 'Длина', with: '10'
      fill_in 'Ширина', with: '50'
      fill_in 'Высота', with: '100'
    end

    click_on 'Рассчитать'
    expect(page).to have_content '30'
  end
end