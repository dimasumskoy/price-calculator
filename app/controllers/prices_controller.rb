class PricesController < ApplicationController
  def new
  end

  def calculate
    if price_params.present?
      @price = Price.calculate(price_params)
      render :new
    else
      redirect_to '/prices/calculate'
    end
  end

  private

  def price_params
    params.permit(:weight, :length, :width, :height, cities: [:depart_city, :delivery_city])
  end
end
