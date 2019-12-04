Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "users#index"

  resources :users do
    collection do
      get "profile_registration"
    end
  end

  resources :sessions
  resources :items

end
