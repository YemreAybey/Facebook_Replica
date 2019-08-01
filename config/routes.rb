Rails.application.routes.draw do
  devise_for :users
  get "/home", to: "static_pages#home"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # root to: redirect("/users/sign_up") 
  devise_scope :user do
    authenticated :user do
      root 'static_pages#home', as: :authenticated_root
    end

    unauthenticated do
      root 'devise/registrations#new', as: :unauthenticated_root
    end
  end
  
  resources :posts
  resources :users, only: :show
end
