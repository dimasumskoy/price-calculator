class Price < ApplicationRecord
  def self.calculate(params)
    depart_city   = params[:cities][:depart_city]
    delivery_city = params[:cities][:delivery_city]
    weight        = params[:weight].to_i
    length        = params[:length].to_i
    width         = params[:width].to_i
    height        = params[:height].to_i

    max_area_id    = City.max_area(depart_city, delivery_city)
    max_area_price = Area.find(max_area_id).price

    volume_weight = (length * width * height) / 5000
    max_area_price * [weight, volume_weight].max
  end
end