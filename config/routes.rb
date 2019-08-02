Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'homes#index'

  get '/homes/new', to: "homes#new"
  get '/homes/show', to: "homes#show"
  #resources :homes
end
