var = Rails.application.routes.draw do
  root 'home#index'
  devise_for :users
  get '/admin', to: "admin#index", as: "admin"
  namespace :admin do
    resources :faculties
    resources :test_types
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
