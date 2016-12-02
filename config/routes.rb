Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "welcome#index"
  get '/home', to: 'users#home'
  resources :posts
  resources :profiles
  get '/my_profile', to: 'users#my_profile'
end
