Rails.application.routes.draw do
  resources :rails
  resources :tracks
  devise_for :users, :controllers => { registrations: 'registrations' }



  root to: 'welcome#index'

end
