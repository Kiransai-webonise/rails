Rails.application.routes.draw do
  devise_for :users
  resources :blogs
  root to: 'blogs#index'
  put 'blogs/change_status/:id', to: 'blogs#change_status', as: 'change_status'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
