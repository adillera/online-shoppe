Rails.application.routes.draw do
  devise_for :admins
  namespace :admin do
    root to: 'dashboard#index'

    resources :products
  end
end
