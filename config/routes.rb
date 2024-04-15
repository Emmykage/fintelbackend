Rails.application.routes.draw do


  
  # post '/login', to: "users#login"
  root "api/v1/statistics#index"

  namespace :api do
    namespace :v1 do

      # root to: 'statistics#index'

      resources :statistics, only: %i[index]
      resources :triggers,  only: %i[create update]
      resources :pockets do
        collection do
          get :get_pocket
        end
      end

      resources :portfolios do
        collection do 
            post :create_interests
        end
        resources :portfolio_interests

      end
      resources :plans
      resources :transactions do
        collection do 
          get :user_transaction
        end

      end
      resources :wallets do
        get "get_adminstat", on: :collection
      end
      resources :earning_transactions
      resources :earnings
      resources :users do
        collection do
          post :login
          get :account

        end

      end

    end

  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "/api/v1/statistics#index"
end
