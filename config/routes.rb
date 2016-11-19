Rails.application.routes.draw do
  resources :users
  root to: 'welcome#index'
  get '/auth/:provider/callback' => 'sessions#create'
  get '/signin' => 'sessions#new', :as => :signin
  get '/signout' => 'sessions#destroy', :as => :signout
  get '/auth/failure' => 'sessions#failure'

  resources :loan_applications
  resources :about_you
end
