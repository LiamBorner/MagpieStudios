Rails.application.routes.draw do
  resources :rails
  resources :tracks
  resources :admin_tracks
  resources :contacts, only: [:new, :create]
  devise_for :users, :controllers => { registrations: 'registrations' }

  get 'privacy' => 'privacy#index'


  root to: 'welcome#index'

end
