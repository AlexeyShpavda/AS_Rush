Rails.application.routes.draw do
  get 'welcome/index'

  resources :articles
  resources :pictures, only: [:create, :destroy]
  resources :tags, only: [:show]

  root 'welcome#index'
end
