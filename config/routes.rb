Rails.application.routes.draw do
	resources :buyers, only: [:edit, :update]
	resources :sellers, only: [:edit, :update]
  devise_for :accounts,  :controllers => { :registrations => 'registrations' }
  resources :orders
  mount ActionCable.server => '/cable'
  get 'search', to: 'store#search'
  resources :carts
  root 'store#index', as: 'store_index'
#  root to: redirect('/products')
  resources :products
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.htm

  resources :line_items do
    member do
      patch "decrement"
    end
  end
  
end
