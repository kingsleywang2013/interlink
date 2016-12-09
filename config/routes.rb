Rails.application.routes.draw do
  get 'subscribe/new'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "welcome#index"
  get '/home', to: 'users#home'
  resources :posts do
    member do
      put 'like', to: 'posts#upvote'
      put 'dislike', to: 'posts#downvote'
    end
  end
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
  get '/my_saved_jobs', to: 'users#my_saved_jobs'
  resources :user_job_relations, only: [:destroy]
  resources :comments
  resources :plans
  resources :apply_jobs, only: [:new, :create]
  get "*path", to: redirect('/')
end
