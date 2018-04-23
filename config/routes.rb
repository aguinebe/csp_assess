Rails.application.routes.draw do
  resources :logins
  resources :roles
  resources :capabilities
  resources :subcategories
  resources :categories
  resources :goals

  root 'main#index'
  get 'form' => 'main#form'
  post 'set' => 'main#set'
  get 'deleteplan' => 'main#deleteplan'
  get 'login' => 'main#login'
  get 'howtologin' => 'main#howtologin'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
