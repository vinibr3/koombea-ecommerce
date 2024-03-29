Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  scope '/:locale' do
    resources :sessions, only: %i[new create destroy]
    resources :registrations, only: %i[new create]
    resources :cart_items, only: %i[index create destroy]
    resources :products, only: %i[index]
    resources :checkouts, only: %i[new create]
    resources :orders, only: %i[index show]
    get '/home', to: 'pages#home'
  end
  root 'sessions#new'
end
