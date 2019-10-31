Rails.application.routes.draw do
  get root 'top#top'
  
  get '/home/about', to: 'top#home'
  
  devise_for :users
  
  resources :users
  
  resources :books
  
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
