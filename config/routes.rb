Rails.application.routes.draw do

  root 'home#index'
  resources :pictures, only: [:create, :show]

end
