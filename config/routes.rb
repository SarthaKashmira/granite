# frozen_string_literal: true

Rails.application.routes.draw do
  constraints(lambda { |req| req.format == :json }) do
    namespace :api do
      namespace :v1 do
        resources :tasks, except: %i[new edit], param: :slug do
          collection do
            resource :report, only: %i[create], module: :tasks do
              get :download, on: :collection
            end
          end
        end
        resource :preference, only: %i[show update] do
          patch :mail, on: :collection
        end
        resources :users, only: %i[index create]
        resource :session, only: [:create, :destroy]
        resources :comments, only: [:create, :destroy]
      end
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  root "home#index"
  get "*path", to: "home#index", via: :all
end
