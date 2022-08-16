Rails.application.routes.draw do
  devise_for :users
  resources :blogs
  put 'blogs/change_status/:id', to: 'blogs#change_status', as: 'change_status'

  mount Articles::Engine, at: "/static_pages"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
