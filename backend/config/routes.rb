# frozen_string_literal: true

Rails.application.routes.draw do
  resources :tasks
  resources :projects
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'home#index'

  # post 'refresh', to: 'refresh#create'
  post 'login', to: 'sessions#create'
  post 'register', to: 'registrations#create'
  # delete 'logout', to: 'sessions#destroy'
end
