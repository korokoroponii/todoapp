Rails.application.routes.draw do
  root "groups#index"

  get "groups/index" => "groups#index"
  get "groups/new" => "groups#new"
  post "groups/create" => "groups#create"
  patch "groups/join" => "groups#join"
  get "groups/:id" => "groups#show"


  resources :groups, shallow: true do

    get "posts/index" => "posts#index"
    get "posts/new" => "posts#new"
    post "posts/create" => "posts#create"
    get "posts/:id" => "posts#show"
    get "posts/:id/edit" => "posts#edit"
    post "posts/:id/update" => "posts#update"
    post "posts/:id/destroy" => "posts#destroy"
    post "posts/post_hide/:id" => "posts#post_hide"
  end

  get "users/index" => "users#index"
  get "signup" => "users#new"
  post "login" => "users#login"
  post "logout" => "users#logout"
  get "login" => "users#login_form"
  post "users/create" => "users#create"
  get "users/:id" => "users#show"
  get "users/:id/edit" => "users#edit"
  post "users/:id/update" => "users#update"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
