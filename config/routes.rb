Rails.application.routes.draw do

  get '/dashboard', to: 'sessions#new'
  # root to: 'sessions#dashboard'

end
