Rails.application.routes.draw do
  resources :goals
  resources :ministers
  resources :options
  resources :events
  resources :countries
  root 'application#home_page'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
