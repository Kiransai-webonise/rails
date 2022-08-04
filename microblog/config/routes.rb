Rails.application.routes.draw do
  resources :blogs
  put 'blogs/change_status/:id', to: 'blogs#change_status', as: 'change_status'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
