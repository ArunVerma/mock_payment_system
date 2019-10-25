# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  constraints :subdomain => 'api' do
    scope module: :api, defaults: {format: :json} do
      namespace :v1 do
      	resources :transactions, only: [:index, :create] do
      		get 'merchant_transactions/:merchant_id', on: :collection, to: 'transactions#merchant_transactions'
      	end
      end
    end
  end
end
