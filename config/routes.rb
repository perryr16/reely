Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # resources actor
  get '/', to: 'splash#index'
  
  # resources :movie_search, only: [:create, :index]
  resources :dbless_search, only: [:create, :index]
  resources :user_movies, only: [:create, :index, :destroy]
  resources :comments, only: [:create, :destroy]

  resources :movies do 
    resources :streaming, only: [:index, :show, :create]
  end

  get '/movies/:movie_id/comments', to: 'comments#new'
  get 'auth/:provider/callback', to: 'sessions#create'
  get '/profile', to: 'users#show'
  get '/logout', to: 'sessions#destroy'
  get '/show', to: 'splash#show'
end
