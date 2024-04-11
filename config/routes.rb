Rails.application.routes.draw do

  
  # post '/login', to: "users#login"

  namespace :api do
    namespace :v1 do
      resources :portfolio_interests
      resources :pockets do
        collection do
          get :get_pocket
        end
      end

      resources :portfolios do
        resources :portfolio_interests

      end
      resources :plans
      resources :transactions do
        collection do 
          post :user_transaction
        end

      end
      resources :wallets
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
  # root "posts#index"
end
