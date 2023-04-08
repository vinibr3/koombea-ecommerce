Rails.application.routes.draw do
  scope '/:locale' do
    resources :sessions, only: %i[new create destroy]
    resources :registrations, only: %i[new create]
    get '/home', to: 'pages#home'
  end
  root 'sessions#new'
end
