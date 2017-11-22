Rails.application.routes.draw do
  resources :order_details
  resources :orders
  resources :users
  resources :products
  namespace :admin do
    resources :products
  end
end
