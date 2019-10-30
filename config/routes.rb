# frozen_string_literal: true

require 'sidekiq/web'
Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'merchants#index'
  mount Sidekiq::Web => '/sidekiq'
  resources :merchants do
    resources :transactions, only: %i[index]
  end
  constraints subdomain: 'api' do
    scope module: :api, defaults: { format: :json } do
      namespace :v1 do
        resources :transactions, only: %i[index create] do
          collection do
            get 'merchant_transactions/:merchant_id', to: 'transactions#merchant_transactions'
          end
        end
      end
    end
  end
end
