Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :users  
  resources :tokens, only: [:create]
  resources :books
  resources :students
end
