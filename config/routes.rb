Rails.application.routes.draw do
  
  resources :questions
 
  get "/", to: 'application#home'
  root 'application#home'
  resources :moves
  resources :generations
  resources :pokemons

  resources :users

  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/sessions", to: "sessions#destroy"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
