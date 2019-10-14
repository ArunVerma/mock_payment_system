# frozen_string_literal: true

class Transaction < ApplicationRecord
  belongs_to: :merchant
  validates :merchant, presence: true
  validates :uuid, :amount, :status, presence: true
  validates :amount, numericality: { only_integer: true }
  scope :successful, -> { where(status: 'success') }
  scope :erred, -> { where(status: 'error') }
end
