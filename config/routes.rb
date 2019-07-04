Rails.application.routes.draw do
  get 'password_resets/new'
  get 'password_resets/edit'
  resources :users
  resources :account_activations, only: [:edit]
  resources :testimonials
  resources :password_resets, only: [:new, :edit, :update, :create]
  resources :microposts, only: [:create, :destroy]
  get 'users/new'
  root 'static_pages#home'
  get '/about', to: 'static_pages#about'
  get '/contact', to: 'static_pages#contact'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
