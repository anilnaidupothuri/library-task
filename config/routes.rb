# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :users
  resources :tokens, only: [:create]
  resources :books
  resources :students
  get 'returned_books', to: 'assigned_books#returned'
  post 'book_recive', to: 'assigned_books#book_recive'
  resources :assigned_books
end
