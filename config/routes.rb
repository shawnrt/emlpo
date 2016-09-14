Rails.application.routes.draw do

  devise_for :users
  get "*path" => redirect("https://emlpo.ca/%{path}"), :constraints => { :protocol => "http://" }
  get "*path" => redirect("https://emlpo.ca/%{path}"), :constraints => { :subdomain => "" }
  root 'home#index'
  get 'about' => 'about#index'
  get 'resources' => 'resources#index'
  get 'contact' => 'contact#index'
  get 'letter' => 'letter#index'
  get 'advertising' => 'advertising#index'
  get 'success' => 'success#index'

  get "/login/:token" => "memberships#login"
  get "/logout" => "memberships#logout"

  delete "/memberships/:id" => "memberships#destroy"


  resources :memberships do |memberships|
    resources :charges
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
