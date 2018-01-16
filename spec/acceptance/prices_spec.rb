require 'rails_helper'

feature 'price calculation' do
  given!(:area1) { create(:area, price: 1, area: 1) }
  given!(:area2) { create(:area, price: 2, area: 2) }

  given!(:city1)   { create(:city, name: 'Москва', area: area1) }
  given!(:city2)   { create(:city, name: 'Санкт-Петербург', area: area2) }

  scenario 'user can calculate the price', js: true do
    visit '/prices/calculate'

    expect(page).to have_content 'Город отправления'
    expect(page).to have_content 'Город доставки'

    fill_in 'Вес', with: 10

    within('.dimensions') do
      fill_in 'Длина', with: '10'
      fill_in 'Ширина', with: '50'
      fill_in 'Высота', with: '100'
    end

    click_on 'Рассчитать'
    expect(page).to have_content '10'
  end
end