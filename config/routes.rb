Rails.application.routes.draw do
  resources :plex, only: %i(index update)
end
