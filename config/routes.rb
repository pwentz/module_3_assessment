Rails.application.routes.draw do
  root 'items#index'

  resources :items,  only: [:index, :show]
  resources :orders, only: [:index, :show]
  resources :users,  only: [:index, :show]

  namespace :api do
    namespace :v1 do
      get '/items', to: 'items#index', as: 'items'
      get '/items/:id', to: 'items#show', as: 'item'
      delete '/items/:id', to: 'items#destroy'
      post '/items', to: 'items#create'
    end
  end

  get '/search', to: 'search#index', as: 'search'
end
