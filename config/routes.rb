Rails.application.routes.draw do
  resources :flights, only: [:index] do
    resources :transactions, only: [:index, :new, :create]
  end
 
  root "flights#index"
end
