# frozen_string_literal: true

# Merchants Controller
class MerchantsController < ApplicationController
  def index
    @merchants = Merchant.select('merchants.*, COUNT(transactions.id) as transaction_count')
                         .joins('LEFT OUTER JOIN transactions ON (transactions.merchant_id = merchants.id)')
                         .group('merchants.id')
  end
end
