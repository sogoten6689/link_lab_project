var = Rails.application.routes.draw do
  scope "(:locale)", locale: /en|vi/ do
    root 'home#index'
    devise_for :users
    get '/admin', to: "admin#index"
    namespace :admin do
      resources :faculties
      resources :test_types
      resources :raw_tests
    end
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
