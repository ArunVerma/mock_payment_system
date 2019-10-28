# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Merchant, type: :model do
  describe 'Validation' do
    context 'by presence of attributes' do
      it 'should have a valid data' do
        create(:merchant).should be_valid
      end
      it 'is invalid without name' do
        build(:merchant, name: nil).should_not be_valid
      end
      it 'is invalid without email' do
        build(:merchant, email: nil).should_not be_valid
      end
      it 'is invalid without status' do
        build(:merchant, status: nil).should_not be_valid
      end
      it 'is invalid without description' do
        build(:merchant, description: nil).should_not be_valid
      end
    end
  end
end
