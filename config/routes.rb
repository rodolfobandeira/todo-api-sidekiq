require 'sidekiq/web'

Rails.application.routes.draw do
  resources :todos

  root to: 'todos#new'
  mount Sidekiq::Web, at: '/sidekiq'
end

