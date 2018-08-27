Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'songs#index'
  resources :songs, only: [:index]
  resources :artists, only: [:new, :create, :index]
end
