Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "test_cases#index"
  resources :test_cases do
    get :selected_to_test, on: :collection
    get :search, on: :collection
    get :categories, on: :collection
    post :tested, on: :collection
    post :select_to_test, on: :collection

    get :playground, on: :collection
  end
end
