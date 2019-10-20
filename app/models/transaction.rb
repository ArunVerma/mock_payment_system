# frozen_string_literal: true

# Transaction model
class Transaction < ApplicationRecord
  belongs_to :merchant
  validates :merchant, :uuid, :amount, :status, presence: true
  validates :amount, numericality: { greater_than: 0 }

  scope :successful, -> { where(status: 'success') }
  scope :erroed, -> { where(status: 'error') }
end
