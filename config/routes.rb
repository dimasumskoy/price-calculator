Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/prices/calculate', to: 'prices#new'
  get '/prices', to: 'prices#calculate'
end
