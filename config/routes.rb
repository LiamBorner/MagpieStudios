Rails.application.routes.draw do
  resources :tracks
  devise_for :users

  root to: 'welcome#index'
  
end
