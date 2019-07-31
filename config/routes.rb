Rails.application.routes.draw do
  devise_for :users
  get 'static_pages/home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # root to: redirect("/users/sign_up") 
  root to: 'static_pages#home'
  resources :posts
end
