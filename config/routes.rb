Rails.application.routes.draw do
  devise_for :users
  root 'users#index'

  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show, :new, :create]
  end

  resources :posts, only: [:new, :create] do
    resources :comments, only: [:new, :create]
    resources :likes, only: [:create]
  end

  get '/home_route', to: 'home#index'

  namespace :api do
    namespace :v1 do
      resources :users, only: [] do
        resources :posts, only: [:index] # Endpoint to list all posts for a user
      end

      resources :posts, only: [] do
        resources :comments, only: [:index, :create] # Endpoint to list all comments for a user's post and add a comment to a post
      end
    end
  end
end
