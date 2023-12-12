Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "check_items#index"
  get 'check_items/selected_to_test', to: "check_items#selected_to_test"
  post 'check_items/tested', to: "check_items#tested"
  get 'check_items/search', to: 'check_items#search'
  post 'check_items/select_to_test', to: 'check_items#select_to_test'
  resources :check_items
end
