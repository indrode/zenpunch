Rails.application.routes.draw do
  root to: 'static#index'
  resources :plex, only: %i(index update)
  match '*path', to: 'application#routing_error', via: :all
end
