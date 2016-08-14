Rails.application.routes.draw do

  devise_for :users
  root 'home#index'
  get 'about' => 'about#index'
  get 'resources' => 'resources#index'
  get 'contact' => 'contact#index'
  get 'letter' => 'letter#index'

  resources :memberships
  resources :charges

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
