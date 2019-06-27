Rails.application.routes.draw do
  resources :flights, only: [:index]
  resources :transactions, only: [:index, :create]
 
  root "flights#index"
end
