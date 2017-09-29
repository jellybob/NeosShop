Rails.application.routes.draw do  

  resources :items,            only: [:index]
  resources :order_items,      only: [:create, :update, :destroy]
  resource  :carts,            only: [:show]
  resources :order_promotions, only: [:create, :destroy]
  resources :cards,            only: [:create]
  resources :checkouts,        only: [:index] do
    collection do
      get 'thankyou' => 'checkouts#thank_you'
    end
  end
  devise_for :users

  root to: 'items#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
