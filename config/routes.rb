Rails.application.routes.draw do
  scope "(:locale)", locale: /en|vi/ do
    get "/login", to: "sessions#new"
    post "/login", to: "sessions#create"
    delete "/logout", to: "sessions#destroy"
    get "static_pages/home"
    root "static_pages#home"
    resources :books, only: %i(index show)
    resources :accounts, only: [:new, :create]
    resources :users, only: [:new, :create]
    namespace :admin do
      resources :users, only: :index do
        member do
          post "due_reminder"
        end
      end
      resources :accounts do
        member do
          post "update_status"
        end
      end
    end
  end
end
