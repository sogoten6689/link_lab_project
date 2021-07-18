var = Rails.application.routes.draw do
  scope "(:locale)", locale: /en|vi/ do
    root 'home#index'
    get '/contact', to: 'home#contact'
    devise_for :users
    get '/admin', to: "admin#index"
    get '/admin/contact', to: "admin#contact"
    get '/admin/register_test', to: "admin/my_tests#new"
    post '/admin/register_test', to: "admin/my_tests#create"
    resources :result_tests
    namespace :admin do
      resources :faculties
      resources :test_types
      resources :raw_tests
      resources :labs
      resources :doctors
      resources :users
      resources :lab_tests
      resources :user_tests
      resources :my_tests
      resources :posts
      resources :my_labs
    end
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
