Rails.application.routes.draw do
  resources :trains
  resources :users
  resources :railway_stations
  resources :tickets
  resources :routes
  resources :wagons
  get 'welcome/index'
  root 'welcome#index'
end
