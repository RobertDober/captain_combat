Rails.application.routes.draw do
  resources :players
  resources :arenas
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'arenas#show'
end
