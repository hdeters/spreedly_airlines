Rails.application.routes.draw do
  resources :flights, only: [:index]
  resources :transactions, only: [:index, :create]
  resources :cards, only: [:destroy]
 
  root "flights#index"
end
