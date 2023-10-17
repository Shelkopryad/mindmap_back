Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "check_items#index"
  post 'check_items/add_new', to: 'check_items#add_new'
  resources "check_items"
end
