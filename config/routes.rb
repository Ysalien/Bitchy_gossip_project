Rails.application.routes.draw do
  root 'static_pages#home'
  get 'team', to: 'static_pages#team'
  get 'contact', to: 'static_pages#contact'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  resources :users do
  resources :gossips do
  resources :comments
  resources :likes
  end
  end
  
end
