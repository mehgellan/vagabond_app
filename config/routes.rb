Rails.application.routes.draw do
  root to: "users#index"
  get "/users", to: "users#index", as: "users"
  get "/users/new", to: "users#new", as: "new_user"
  post "/users", to: "users#create"
  get "/users/:id", to: "users#show", as: "user"
  get "/login", to: "sessions#new", as: "user_login"
  get "/logout", to: "sessions#destroy", as: "user_logout"
  post "/sessions", to: "sessions#create"
  get "/users/:id/edit", to: "users#edit", as: "edit_user"
  patch "/users/:id", to: "users#update"

  get "/cities", to: "cities#index", as: "cities"
  get "/cities/new", to: "cities#new", as: "new_city"
  post "/cities", to: "cities#create"
  get "/cities/:id", to: "cities#show", as: "city"

  get "/cities/:city_id/posts", to: "posts#index", as: "city_posts"
  get "/cities/:city_id/posts/new", to: "posts#new", as: "new_city_post"
  post "/cities/:city_id/posts", to: "posts#create"
  get "/cities/:city_id/posts/:id", to: "posts#show", as: "city_post"
  get "/cities/:city_id/posts/:id/edit", to: "posts#edit", as: "edit_posts"

  # resources :cities do
  #   resources :posts
  # end
end
