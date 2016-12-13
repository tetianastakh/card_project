Rails.application.routes.draw do
  root 'sessions#new'
  resources :users
  resources :cards
  get 'sessions/new' 
  get    'signup'  => 'users#new'
  post 'signup'  => 'users#create'
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
end
