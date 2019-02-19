Rails.application.routes.draw do
  get 'search', to: 'store#search'
  resources :line_items
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
