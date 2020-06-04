Rails.application.routes.draw do
  root 'static_pages#top'
  resources :users, only:[:create]

  get 'signup', to: 'users#new'
  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  post 'logout', to: 'user_sessions#destroy'
end
