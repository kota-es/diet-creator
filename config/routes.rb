Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "users#index"

  resources :users, only: [:index, :new, :create, :edit, :update] do
    get "profile_edit", on: :member
    collection do
      get "profile_registration"
    end
  end

  resources :sessions, only: [:new, :create, :destroy]

  resources :lists, only: [:show]

  resources :items, only: [:index, :new, :create, :show, :edit, :update] do
    resources :reviews, only: [:new, :create, :edit, :update, :destroy]
    collection do
      get "search"
    end
    post "/add_item", to: "lists#add_item"
    delete "/delete_item", to: "lists#delete_item", on: :member
  end

  resources :records, only: [:index, :create] 

  delete "/record_items/:id/delete_item", to: "records#delete_item"

end
