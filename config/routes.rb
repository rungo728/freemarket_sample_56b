Rails.application.routes.draw do
  devise_for :users

  #仮のルーティング
  root 'items#index'
  get '/items/new', to: 'items#new'
  get '/items/show', to: 'items#show'
  get 'users/show', to: 'users#show'
  get 'user/edit', to: 'users#edit'
  get 'items/confirmation', to: 'items#confirmation'
  get 'identification', to: 'users#identification'
  get 'logout', to: 'users#logout'
  get 'card', to: 'users#card'
  get 'signup', to: 'tests#signup'
  get 'login', to: 'tests#login'
  get 'phone', to: 'tests#phone'
  get 'registration', to: 'tests#registration'
  get 'address', to: 'tests#address'
  get 'payment', to: 'tests#payment'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
