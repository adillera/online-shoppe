Rails.application.routes.draw do
  devise_for :admins

  namespace :admin do
    root to: 'dashboard#index'
  end
end
