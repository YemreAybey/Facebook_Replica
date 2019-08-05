Rails.application.routes.draw do
  get 'comments/create'
  get 'comments/edit'
  devise_for :users
  get "/home", to: "static_pages#home"
  #get "/sign_up", to: 'devise/registrations#new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # root to: redirect("/users/sign_up")
  devise_scope :user do
    post "signup" => "devise/registrations#create"
  end
  devise_scope :user do
    authenticated :user do
      root 'posts#index', as: :authenticated_root
    end

    unauthenticated do
      root 'devise/registrations#new', as: :unauthenticated_root
    end
  end
  
  resources :posts
  resources :users, only: :show
  resources :comments
  resources :likes, only: [:create, :destroy]
end
