Rails.application.routes.draw do
	namespace :api, defaults: {format: 'json'} do
    namespace :v1 do
      
      post '/users/login' => 'user_token#create'
      post '/users/logout' => 'users#logout'
      get '/users/me' => 'users#me'
      resources :users, only: [:create]
      resources :profiles, only: [:show, :update]
      resources :businesses, only: [:show, :update]
      resources :employers, only: [:show, :update]
    end
  end
end
