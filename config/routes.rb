Rails.application.routes.draw do
  resources :options
  resources :events
  resources :countries
  root 'application#home_page'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
