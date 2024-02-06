Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "test_cases#index"
  get 'test_cases/selected_to_test', to: "test_cases#selected_to_test"
  post 'test_cases/tested', to: "test_cases#tested"
  get 'test_cases/search', to: 'test_cases#search'
  post 'test_cases/select_to_test', to: 'test_cases#select_to_test'
  resources :test_cases
  resources :infrastructure
end
