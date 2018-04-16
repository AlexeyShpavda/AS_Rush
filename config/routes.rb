Rails.application.routes.draw do
  get 'welcome/index'

  resources :articles
  resources :pictures, only: [:create, :destroy]

  root 'welcome#index'
end
