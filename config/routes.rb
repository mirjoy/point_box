Rails.application.routes.draw do
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get '/dashboard/', to: 'sessions#index'

  get '/rewards', to: 'rewards#index'

  get '/admin', to: 'admins#index'
  root to: 'sessions#new'

end
