Rails.application.routes.draw do

  get 'bookings/new'

  get 'bookings/create'

  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  root to: 'flights#index'
  resources :jets, only: [:index, :new, :create, :destroy]
  resources :flights do
    resources :reviews, only: [:new, :create]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
