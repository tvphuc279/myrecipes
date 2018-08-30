Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations', sessions: 'users/sessions' }
  root 'pages#home'
  
  get 'pages/home', to: 'pages#home'
  resources :recipes do 
    resources :comments
  end
  mount ActionCable.server => '/cable'
end
