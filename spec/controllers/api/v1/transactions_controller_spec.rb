# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::V1::TransactionsController, type: :controller do
  let(:merchant) { create(:merchant) }
  let(:invalid_params) do
    {
      transaction_details:
      {
        'amount' => 120,
        'status' => 'active'
      }
    }
  end
  describe 'POST #create' do
    context 'with invalid params' do
      before do
        post :create, params: invalid_params, format: :json
      end
      it 'returns unautorized merchant without merchant' do
        message = JSON.parse(response.body)['errors'].first
        expect(message).to eq('Merchant unauthorized')
      end

      it 'returns unautorized as status without merchant' do
        res = JSON.parse(response.body)
        expect(res['status']).to eq('unauthorized')
      end
    end

    context 'with missing rquired data' do
      before do
        params = { merchant_id: merchant.id, transaction_details: invalid_params }
        post :create, params: params, format: :json
      end
      it 'returns unprocessable_entity as status' do
        res = JSON.parse(response.body)
        expect(res['status']).to eq('unprocessable_entity')
      end
    end

    context 'with valid data' do
      before do
        valid_params = {
          'merchant_id' => merchant.id,
          transaction_details: {
            'amount' => 120,
            'status' => 'active',
            'uuid' => 'dhabd889d'
          }
        }
        post :create, params: valid_params, format: :json
      end
      it 'returns 200 as status' do
        res = JSON.parse(response.body)
        expect(res['status']).to eq(200)
      end
    end
  end

  describe 'GET' do
    let(:transaction) { create(:transaction) }
    context 'with valid data' do
      it 'index return success true' do
        get :index, format: :json
        res = JSON.parse(response.body)
        expect(res['success']).to eq(true)
      end

      it 'merchant_transactions return success true' do
        get :merchant_transactions, params: { merchant_id: transaction.merchant.id }, format: :json
        res = JSON.parse(response.body)
        expect(res['success']).to eq(true)
      end
    end
  end
end
