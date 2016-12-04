Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "welcome#index"
  get '/home', to: 'users#home'
  resources :posts
  resources :profiles
  get '/my_profile', to: 'users#my_profile'
  get '/my_friends', to: 'users#my_friends'
  get '/my_jobs', to: 'users#my_jobs'
  get '/search_friend', to: 'users#search_friend'
  post '/add_friend', to: 'users#add_friend'
  resources :friendships, only: [:destroy]
  resources :jobs
  get '/search_job', to: 'users#search_job'
  post '/add_job', to: 'users#add_job'
end
