Rails.application.routes.draw do
  devise_for :users

  #仮のルーティング
  root 'items#index'
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

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
