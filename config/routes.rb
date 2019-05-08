Rails.application.routes.draw do
  resources :responses
  resources :questions
  resources :answers
  get "/", to: 'application#home'
  root 'application#home'
  resources :moves
  resources :generations
  resources :pokemons
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
