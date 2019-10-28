# frozen_string_literal: true

# Transaction model
class Transaction < ApplicationRecord
  belongs_to :merchant
  validates :merchant, :uuid, :amount, :status, presence: true
  validates :amount, numericality: { greater_than: 0 }

  scope :successful, -> { where(status: 'success') }
  scope :erroed, -> { where(status: 'error') }

  after_save :save_total_transaction

  def save_total_transaction
    sum = merchant.transactions_sum += amount
    merchant.update(transactions_sum: sum)
  end
end
