Rails.application.routes.draw do
  root 'pages#home'
  get 'about', to: 'pages#about'
  resources :articles
  get 'signup', to: 'users#new'
  post 'signup', to: 'users#create'
  resources :users, except: [:new, :create]
end
