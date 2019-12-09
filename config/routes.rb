Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "users#index"

  resources :users do
    get "profile_edit", on: :member
    collection do
      get "profile_registration"
    end
  end

  resources :sessions

  resources :lists, only: [:show]

  resources :items do
    resources :reviews
    post "/add_item", to: "lists#add_item"
    delete "/delete_item", to: "lists#delete_item", on: :member
  end

  resources :records, only: [:index, :create]

end
