Rails.application.routes.draw do

    post "/signup", to: "users#signup"
    post "/login", to: "users#login"
    get "/users/:id", to: "users#show"
    patch "/users/:id", to: "users#update"
    delete "/users/:id", to: "users#destroy"

    post "/friendships", to: "friendships#create"
    delete "/friendships/:id", to: "friendships#destroy"

    post "/honks", to: "honks#create"
    delete "honks/:id", to: "honks#destroy"

    get "/posts", to: "posts#index"
    get "/posts/:id", to: "posts#show"
    post "/posts", to: "posts#create"
    patch "/posts/:id", to: "posts#update"
    delete "/posts/:id", to: "posts#destroy"

    post "/comments", to: "comments#create"
    patch "/comments/:id", to: "comments#update"
    delete "/comments/:id", to: "comments#destroy"






end
