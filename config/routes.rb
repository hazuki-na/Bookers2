Rails.application.routes.draw do
  
  devise_for :users, controllers: {
  sessions: 'users/sessions',
  registrations: 'users/registrations'
  }
  
  get root 'top#top'
  
  get '/home/about', to: 'top#home'
  
  resources :users
  
  resources :books

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
