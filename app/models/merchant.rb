# frozen_string_literal: true

class Merchant < ApplicationRecord
  has_many: :transactions, dependent: :destroy
  validates :name, :description, :email, :status, :total_transaction_sum, presence: true
  validates :total_transaction_sum, numericality: { only_integer: true }
  scope :active, -> { where(status: 'active') }
  scope :inactive, -> { where(status: 'inactive') }
end
