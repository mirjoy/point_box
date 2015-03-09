Rails.application.routes.draw do
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get '/dashboard/', to: 'sessions#index'

  resources :rewards
  resources :admin, except: [:edit ]
  root to: 'sessions#new'

end
