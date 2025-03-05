# frozen_string_literal: true

Rails.application.routes.draw do
  constraints(lambda { |req| req.format == :json }) do
    namespace :api do
      namespace :v1 do
        resources :tasks, except: %i[new edit], param: :slug
        resources :users, only: %i[index create]
        resource :session, only: :create
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
