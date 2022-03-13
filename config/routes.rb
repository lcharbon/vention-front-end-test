Rails.application.routes.draw do
  resources :products, only: [:create, :index] 
  post "products/:id/add_to_cart", to: "products#add_to_cart", as: "add_to_cart"
  delete "products/:id/remove_from_cart", to: "products#remove_from_cart", as: "remove_from_cart"

  
  root to: "products#index"

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
