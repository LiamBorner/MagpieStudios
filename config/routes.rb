Rails.application.routes.draw do
  resources :rails
  resources :tracks
  resources :admin_tracks
  devise_for :users, :controllers => { registrations: 'registrations' }



  root to: 'welcome#index2'

end
