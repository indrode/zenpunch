Rails.application.routes.draw do
  root to: 'static#index'
  resources :plex, only: %i(index update)
  resources :deca, only: %i(create)
  resources :zero, only: %i(index)
  match '*path', to: 'application#routing_error', via: :all
end
