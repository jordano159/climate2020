Rails.application.routes.draw do
  devise_for :admins
  resources :goals
  resources :ministers
  resources :options
  resources :events
  resources :countries
  get '/game_over', to: 'application#game_over'
  root 'application#home_page'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
