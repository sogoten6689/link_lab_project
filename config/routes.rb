var = Rails.application.routes.draw do
  namespace :admin do
    get 'test_type/new'
    get 'test_type/create'
  end
  get 'test_type/new'
  get 'test_type/create'
  root 'home#index'
  devise_for :users
  namespace :admin do
    resources :faculties
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
