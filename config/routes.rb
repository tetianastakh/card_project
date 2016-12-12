Rails.application.routes.draw do
  # get    'login',   to: 'sessions#new'
  # post   'login',   to: 'sessions#create'
  # delete 'logout',  to: 'sessions#destroy'
  root 'sessions#new'
  # get  'signup'  => 'users#new'
  # post '/signup',  to: 'users#create'
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
