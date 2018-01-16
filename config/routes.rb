Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/price/calculate', to: 'prices#new'
  get '/price', to: 'prices#calculate'
end
