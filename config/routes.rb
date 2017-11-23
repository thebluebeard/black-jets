Rails.application.routes.draw do
  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  root to: 'pages#home'
  resources :jets, only: [:index, :new, :create, :destroy]
  resources :flights do
    resources :reviews, only: [:new, :create]
    resources :bookings, only: [:new, :create, :destroy]
  end

  get 'pages/dashboard', 'pages#dashboard'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
