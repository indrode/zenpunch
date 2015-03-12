Rails.application.routes.draw do
  root to: 'static#index'
  resources :plex, only: %i(index update)
end
