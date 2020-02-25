Rails.application.routes.draw do
  devise_for :admins
  resources :goals
  resources :ministers
  resources :options
  resources :events
  resources :countries do
    member do
      get 'game_over'
    end
  end
  get 'new_direction', to: 'application#new_direction'
  get 'hashomer_hatzair', to: 'application#hashomer_hatzair'
  root 'application#home_page'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
