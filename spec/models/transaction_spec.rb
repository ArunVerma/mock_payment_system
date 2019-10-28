# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Transaction, type: :model do
  describe 'Validation' do
    context 'by presence of attributes' do
      it 'should have a valid data' do
        create(:transaction).should be_valid
      end
      it 'is invalid without uuid' do
        build(:transaction, uuid: nil).should_not be_valid
      end
      it 'is invalid without amount' do
        build(:transaction, amount: nil).should_not be_valid
      end
      it 'is invalid without status' do
        build(:transaction, status: nil).should_not be_valid
      end
      it 'is invalid without numeric amount' do
        build(:transaction, amount: nil).should_not be_valid
      end
      it 'is invalid without merchant' do
        build(:transaction, merchant: nil).should_not be_valid
      end
    end
  end

  describe 'On Creating new transaction' do
    context 'amount entered calculate' do
      it 'sum of all transaction for a merchant' do
        transaction = create(:transaction, amount: 100.00)
        transaction.merchant.transactions_sum.should eq 200.00
      end
    end
  end
end
