Rails.application.routes.draw do
  root to: 'plex#main'
  resources :plex, only: %i(index update)
end
