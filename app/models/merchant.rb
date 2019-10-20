# frozen_string_literal: true

# Merchant model
class Merchant < ApplicationRecord
  has_many :transactions, dependent: :destroy
  validates :name, :description, :email, :status, presence: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP } 
  validates :status, inclusion: { in: %w(active inactive) }
  scope :active, -> { where(status: 'active') }
  scope :inactive, -> { where(status: 'inactive') }
end
