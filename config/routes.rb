Rails.application.routes.draw do

  root 'home#index'
  get 'about' => 'about#index'
  get 'resources' => 'resources#index'
  get 'contact' => 'contact#index'

  resources :memberships

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
