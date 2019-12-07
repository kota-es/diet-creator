Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "users#index"

  resources :users do
    collection do
      get "profile_registration"
    end
  end

  resources :sessions

  resources :lists, only: [:show]

  resources :items do
    resources :reviews
    post "/add_item" => "lists#add_item"
    post "/delete_item" => "lists#delete_item"
  end

end
