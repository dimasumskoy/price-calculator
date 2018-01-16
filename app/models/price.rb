class Price < ApplicationRecord
  def self.calculate(price_params)
    depart_city   = price_params[:cities][:depart_city]
    delivery_city = price_params[:cities][:delivery_city]
    weight        = price_params[:weight].to_i
    length        = price_params[:length].to_i
    width         = price_params[:width].to_i
    height        = price_params[:height].to_i

    max_area_id    = City.max_area(depart_city, delivery_city)
    max_area_price = Area.find(max_area_id).price

    volume_weight = (length * width * height) / 5000
    max_area_price * [weight, volume_weight].max
  end
end