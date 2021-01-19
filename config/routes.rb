Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # resources actor
  get '/', to: 'splash#index'
  # resources :best_movie_search, only: [:index]
  # resources :worst_movie_search, only: [:index]
  resources :movie_search, only: [:create, :index]
  resources :dbless_search, only: [:create, :index]
  resources :user_movies, only: [:create, :index, :destroy]
  resources :comments, only: [:create, :new]

  get 'auth/:provider/callback', to: 'sessions#create'

  get '/profile', to: 'users#show'
  get '/logout', to: 'sessions#destroy'
  get '/show', to: 'splash#show'
end
