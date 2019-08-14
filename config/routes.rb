Rails.application.routes.draw do
  post 'user_token' => 'user_token#create'
  devise_for :users

  namespace :api do
    resources :users
    resources :contacts
  end

  constraints subdomain: ['', 'www'] do
    resources :users do 
      resources :phones
    end
    root 'users#index'
  end
end
